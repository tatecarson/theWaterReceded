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

const verb = new Tone
    .Freeverb()
    .toMaster();

const distortion = new Tone
    .Distortion()
    .connect(verb);

const fmsynth = new Tone.FMSynth({
    "harmonicity": 3.01,
    "modulationIndex": 14,
    "oscillator": {
        "type": "triangle"
    },
    "envelope": {
        "attack": 1,
        "decay": 0.3,
        "sustain": 0.1,
        "release": 1.2
    },
    "modulation": {
        "type": "square"
    },
    "modulationEnvelope": {
        "attack": 1,
        "decay": 0.5,
        "sustain": 0.2,
        "release": 0.1
    }
}).connect(distortion);

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

client.on("message", function (address, args) {
    if (address === "/audience") {
        console.log(args);
        let trigger = args[5];
        let freq = linlin(args[0], 60, 500, 1500, 50);
        let dur = linlin(args[2], 130, 450, 1, 8);

        console.log(trigger);

        //note, duration play if trigger is 1
        if (trigger) {
            fmsynth.triggerAttackRelease(freq, dur, Tone.now(), Math.random());
        }
    }
});

client.on("message", (address, args) => {
    if (address === '/clarRecipe') {

        console.log(args)

        kalimba.triggerAttackRelease(args[1], "8n");

    }
});

function linlin(input, inMin, inMax, outMin, outMax) {
    return (input - inMin) / (inMax - inMin) * (outMax - outMin) + outMin;
}
