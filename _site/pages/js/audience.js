const client = new rhizome.Client();

// `rhizome.start` is the first function that should be called. The function
// inside is executed once the client managed to connect.
client.start(function (err) {
  if (err) {
    $("body").html("client failed starting : " + err);
    throw err;
  }

  client.send("/sys/subscribe", ["/"]);
});

client.on("connected", function () {
  console.log("connected");
});

Tone.context.latencyHint = "playback";

const tremolo = new Tone
  .Tremolo(15, 0.75)
  .toMaster()
  .start();

const chorus = new Tone.Chorus(4, 2.5, 0.5);

const reverb = new Tone
  .JCReverb(0.7)
  .toMaster();

const distortion = new Tone
  .Distortion(0.8)
  .toMaster();

const fmsynth = new Tone.FMSynth({
  "harmonicity": 3.01,
  "modulationIndex": 14,
  "oscillator": {
    "type": "triangle"
  },
  "envelope": {
    "attack": 2,
    "decay": 0.3,
    "sustain": 0.1,
    "release": 0.5
  },
  "modulation": {
    "type": "square"
  },
  "modulationEnvelope": {
    "attack": 0.01,
    "decay": 0.5,
    "sustain": 0.2,
    "release": 0.2
  }
}).chain(distortion, reverb, chorus, tremolo);

const noiseDrone = new Tone.NoiseSynth({
  noise: {
    type: 'pink',
    playbackRate: 0.1
  },
  envelope: {
    attackCurve: 'exponential',
    attack: 2,
    decay: 2,
    sustain: 0.5,
    release: 3
  }
}).connect(tremolo, chorus)

const kalimba = new Tone.FMSynth({
  harmonicity: 8,
  modulationIndex: 2,
  oscillator: {
    type: "noise"
  },
  envelope: {
    attack: 0.001,
    decay: 2,
    sustain: 0.1,
    release: 2
  },
  modulation: {
    type: "square"
  },
  modulationEnvelope: {
    attack: 0.002,
    decay: 0.2,
    sustain: 0,
    release: 0.2
  }
}).connect(distortion);

const noisePerc = new Tone.NoiseSynth({
  noise: {
    type: 'white',
    playbackRate: 5
  },
  envelope: {
    attack: 0.001,
    decay: 0.3,
    sustain: 0,
    release: 0.3
  }
}).connect(distortion, reverb);

client.on("message", function (address, args) {
  if (address === "/audience") {
    // arg[0] 37 - 477 arg[1] 30 - 150 arg[2] 130 - 450 arg[3] 1 - 150 arg[4] 1 -
    // 145
    let trigger = args[5];
    let freq = linlin(args[0], 60, 500, 1500, 50);
    let dur = linlin(args[2], 130, 450, 1, 3);
    let amp = linlin(args[2], 130, 450, -3, -30);
    let distMix = linlin(args[1], 30, 150, 0, 1);
    let reverbMix = linlin(args[3], 1 - 150, 0, 1);
    let tremoloMix = linlin(args[4], 1, 145, 0, 1);
    let chorusMix = linlin(args[2], 130, 450, 0, 1);

    console.log(`amp: ${amp}\ndistMix: ${distMix}`)
    //note, duration play if trigger is 1
    if (trigger == 1 && Math.random() > 0.5) {
      if (Math.random() > 0.5) {

        // distortion, reverb, chorus, tremolo
        distortion.wet.value = distMix;
        reverb.wet.value = reverbMix;
        tremolo.wet.value = tremoloMix;
        chorus.wet.value = chorusMix;

        fmsynth.envelope.attack = dur / 2;
        fmsynth.envelope.release = dur / 2;
        fmsynth.volume.value = amp;
        fmsynth.triggerAttackRelease(freq, dur);
      } else {
        // tremolo, chorus
        tremolo.wet.value = tremoloMix;
        chorus.wet.value = chorusMix;

        noiseDrone.volume.value = amp;
        noiseDrone.triggerAttackRelease(dur);
      }
    }
  }
});

client.on("message", (address, args) => {
  if (address === '/clarRecipe') {
    if (Math.random() < 0.5) {
      if (Math.random() > 0.5) {

        kalimba.envelope.attack = random(0.001, 0.01);
        kalimba.envelope.release = random(2, 3);
        kalimba.harmonicity.value = random(7, 9);
        kalimba.volume.value = random(-30, -3);
        kalimba.triggerAttackRelease(args[1], "8n");
      } else {
        noisePerc.noise._playbackRate.value = random(3, 5)
        noisePerc.envelope.attack = random(0.001, 0.01);
        noisePerc.envelope.release = random(0.3, 0.7);
        noisePerc.volume.value = random(-30, -3);

        noisePerc.triggerAttackRelease("8n")
      }
    }

  }
});

function linlin(input, inMin, inMax, outMin, outMax) {
  return (input - inMin) / (inMax - inMin) * (outMax - outMin) + outMin;
}

function random(min, max) {
  return Math.random() * (max - min) + min;
}