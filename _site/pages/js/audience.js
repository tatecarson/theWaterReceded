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
  .JCReverb()
  .toMaster();

const distortion = new Tone
  .Distortion(0.5)
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
    console.log(args);
    let trigger = args[5];
    let freq = linlin(args[0], 60, 500, 1500, 50);
    let dur = linlin(args[2], 130, 450, 1, 3);

    console.log(trigger);

    //note, duration play if trigger is 1
    if (trigger == 1 && Math.random() > 0.5) {
      if (Math.random() > 0.5) {
        fmsynth.envelope.attack = dur / 2;
        fmsynth.envelope.release = dur / 2;
        fmsynth.triggerAttackRelease(freq, dur);
      } else {
        noiseDrone.triggerAttackRelease(dur);
      }
    }
  }
});

client.on("message", (address, args) => {
  if (address === '/clarRecipe') {
    kalimba.triggerAttackRelease(args[1], "8n");
    noisePerc.triggerAttackRelease("8n")
  }
});

function linlin(input, inMin, inMax, outMin, outMax) {
  return (input - inMin) / (inMax - inMin) * (outMax - outMin) + outMin;
}
