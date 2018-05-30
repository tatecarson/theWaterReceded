/*
Tech setup:
- Each player should pick a part 1-3
- go to player1.andthewaterreceded.org , player2, player3
- swipe up on your screen to make fullscreen
- look for green dot to make sure there is a connection

Performance instructions:
- play when the shape turns green for the duration of the shape
- interpret the shapes as attack/release diagrams for loudness
- for pitch take the map the x axis of the phone to the comfortable range of pitch of your instrument
  -the lower the shape on the screen the lower the pitch
  - does not need to be exact, just shows a change over time
  - can tune with electronics

second movement:
- interpret dot size as loudness
*/

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
	//connect to webserver
	b = NetAddr.new("209.177.90.179", 9000);
	// local
	// b = NetAddr.new("localhost", 9000);

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

	Require("GUI");
};
)
