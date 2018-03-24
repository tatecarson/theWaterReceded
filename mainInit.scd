//run this to initialize
//start composition from GUI
(

// s.options.outDevice_("Saffire");
s.options.numOutputBusChannels_(22);
s.options.numPrivateAudioBusChannels = 1024;
s.options.memSize = 8192 * 16;
s.options.sampleRate_(44100);
~defaultOut = 0;


s.waitForBoot{
	Require("SynthDefs");

	s.sync;
	2.wait;

	Require("buses");
	Require("loadWeatherData");
	Require("recipeDataPrep/*");
	Require("asciiToScale");

	//recipe patterns and sync
	Require("recipePatterns.scd");
	Require("recipeNotationSend.scd");
	Require("recipePatternSeq.scd");

	s.sync;

	Require("startComp.scd");

	s.sync;

	"GUI.scd".loadRelative;
	1.wait;
	// ServerView().front
};
)
