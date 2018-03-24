//control everythin

Window.closeAll;
w = Window("nested", Rect(750, 50, 550, 550))
.front
.alwaysOnTop_(true);
w.onClose{ ~timeTask.free;};

~view = CompositeView(w,Rect(0, 0, 550, 550));
q = ~view.addFlowLayout;

~setup = StaticText(~view,150 @50)
  .string_("Setup")
  .font_(Font("Monaco", 20));

q.nextLine;

//local or web
~netAddr = EZListView.new(~view,150@65, " Target");
~netAddr.addItem(\Web, { b = NetAddr.new("ec2-52-53-233-5.us-west-1.compute.amazonaws.com", 9000)}; );
~netAddr.addItem(\LocalHost, { b = NetAddr.new("localhost", 9000)};);
~netAddr.setColors(Color.grey, Color.white);

q.nextLine;

//if local host open terminal without aws key
~awsText = StaticText(~view,150 @30)
  .string_("1. Start AWS -        rhizome config");

q.nextLine;

//logon to EC2
~awsStart = Button(~view, 150@30)
  .states_([
  	["Open Terminal"]
  ])
  .action_({ |v|
    if(v.value == 0){
      "cd ~/documents/AWS; ssh -i \"rhizome-test.pem\" ubuntu@ec2-52-53-233-5.us-west-1.compute.amazonaws.com".runInTerminal;
		}
	}

  );

q.nextLine;

//test to see if connection working
~ctText = StaticText(~view, 150@10)
  .string_("2. Test Connection");

q.nextLine;

~connectTest = Button(~view, 150@30)
  .states_([
  	["ON"],
  	["OFF"]
  ])
  .action_({ |v|
    if(v.value == 1){
  			{b.sendMsg("/working", 1); 1.wait}.fork;
  		}{
        b.sendMsg("/working", 0);
  	}}
  );

q.nextLine;

//start it
~startComp = Button(~view, 150@30)
  .states_([
  	["Start Comp"],
  	["Stop"]
  ])
  .action_({ |v|
    if(v.value == 1){

				//Notation
  			Tdef(\addNodes).play(quant: 0);
        Tdef(\staggered).play;

        ~bass = Synth(\bass, [\out, ~distBusHur]);

        ~timeTask.play; //start timer
      }{
				//Notation
        Tdef(\addNodes).stop;
        Tdef(\staggered).stop;

				//synths
				Pdef.all.do(_.stop);
				Pbindef(\padpat).stop;
        ~bass.free;
        ~seq.stop; ~clock.clear;

				//zero out arays
				~clarTrigger = 0!8;
				~violinTrigger = 0!8;
				~celloTrigger = 0!8;

        ~timeTask.pause; //puase timer
  	}}
  );

Spec.add(\num, [0, 188, \lin, 1]);

~playRange =EZRanger(~view, 400@16,"", \num,{|v| v.value.postln},[0, 188], labelWidth: 0, labelHeight: 60);

//timer
~timeTask = Task.new({ inf.do({ |i|
        var min, secs;
                min = (i / 60).asInteger;
                secs = (i % 60);
                if (secs < 10, {secs = (0.asSymbol ++ secs.asSymbol)});
                ~timeString.string = (min.asSymbol ++ ":" ++ secs.asSymbol);
        1.wait;
        })
}, AppClock);

q.nextLine;
~timeString = StaticText(~view, Rect(25, 15, 300, 100));
~timeString.background=Color.white;
~timeString.align = \center;
~timeString.font = Font("Monaco", 85);
~timeString.string = "0:00";

q.nextLine;
~recipeGui = StaticText(~view, Rect(25, 15, 550, 100));
~recipeGui.background=Color.white;
~recipeGui.align = \center;
~recipeGui.font = Font("Monaco", 45);
