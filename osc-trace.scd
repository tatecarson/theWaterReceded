//starts Rhizome http, osc and localtunnel
(
//make sure the path is correct
"cd ~/Desktop/rhizomep5js/; rhizome config.js".runInTerminal;

//setup localtunnel;
"lt --port 8000 --subdomain tate".runInTerminal;

//or if localtunnel is buggy
//"ngrok http 8000".runInTerminal;

//to start server
b = NetAddr.new("localhost", 9000);
)

//if you need to restart
"killall node".unixCmd;

// Subscribing to receive all messages
b.sendMsg("/sys/subscribe", 9002, "/");

// Now sending stuff
//iphone is around 375 x 600 portrait

(
Tdef(\test, {
  inf.do({|i|
    b.sendMsg("/sc", i%375, rrand(0, 600));
  	1.wait;
  });
}).play;
)


Tdef(\test).stop;

b.sendMsg("/sc", 375, 400);
