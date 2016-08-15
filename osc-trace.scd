// To receive OSC messages from rhizome
(
thisProcess.openUDPPort(9002);
thisProcess.addOSCRecvFunc({ |args|
	("RECEIVED : ".ccatList(args)).postln;
});
)

b = NetAddr.new("localhost", 9000);

// Subscribing to receive all messages
b.sendMsg("/sys/subscribe", 9002, "/");

// Now sending stuff
(
Tdef(\test, {
  inf.do({|i|
		b.sendMsg("/sc", rrand(100, 500), rrand(100, 500));
    1.wait;
  });
}).play;
)
