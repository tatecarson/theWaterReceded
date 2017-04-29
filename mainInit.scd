//are you in the concert hall?
~concerthall = true;
~concerthall = false;


//run this to initialize
//start composition from GUI
(
if(~concerthall,
  {
    s.options.outDevice_("Fireface 802 (23676410)");
    s.options.numOutputBusChannels_(30);
    s.options.numPrivateAudioBusChannels = 1024;
    s.options.numAudioBusChannels = 1024;
    s.options.memSize = 8192 * 16;
    s.options.sampleRate_(48000);
    ~defaultOut = 14;
  },
  {
    s.options.outDevice_("Saffire");
    s.options.numOutputBusChannels_(22);
    s.options.numPrivateAudioBusChannels = 1024;
    s.options.memSize = 8192 * 16;
    s.options.sampleRate_(44100);
    ~defaultOut = 0;
  }
);

s.waitForBoot{
  "SynthDefs.scd".loadRelative;
  s.sync;
  2.wait;
  "buses.scd".loadRelative;

  "loadWeatherData.scd".loadRelative;

  //load recipieDataPrep folder
  "recipeDataPrep/*".loadRelative;

  //round recipes to scale
  "asciiToScale.scd".loadRelative;

  //recipe patterns and sync
  "recipePatterns.scd".loadRelative;
  "recipeNotationSend.scd".loadRelative;
  "recipePatternSeq.scd".loadRelative;
  s.sync;

  "startComp.scd".loadRelative;

  s.sync;

  "GUI.scd".loadRelative;
  1.wait;
  ServerView().front
};
)
