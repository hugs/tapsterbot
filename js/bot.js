// Copyright 2012
// Chris Williams, Jason Huggins
// MIT License

five = require("johnny-five");
ik = require("./ik");
board = new five.Board({ debug: false});
board.on("ready", function() {
  var servo1 = five.Servo({pin: 9});
  var servo2 = five.Servo({pin: 10});
  var servo3 = five.Servo({pin: 11});

  board.repl.inject({
    servo1: servo1, s1: servo1,
    servo2: servo2, s2: servo2,
    servo3: servo3, s3: servo3
  });

  var max = 42;
  var min = 20;
  var range = max - min;
  servo1.move(min);
  servo2.move(min);
  servo3.move(min);

  var dance = function () {
    servo1.move(parseInt((Math.random() * range)+min, 10));
    servo2.move(parseInt((Math.random() * range)+min, 10));
    servo3.move(parseInt((Math.random() * range)+min, 10));
  };

  var dancer;
        
  start_dance = function(){
    if (!dancer)
      dancer = setInterval(dance, 500);
  }
        
  stop_dance = function(){
    if (dancer){
      clearInterval(dancer);
      dancer=null;
    }
  }

  board.repl.inject({
    dance: start_dance,
    chill: stop_dance
  });

  servo1.on("error", function () { console.log(arguments); })
  servo2.on("error", function () { console.log(arguments); })
  servo3.on("error", function () { console.log(arguments); })
});

go = function(x,y,z) {
  angles = ik.inverse(x,y,z);
  s1.move(angles[1]);
  s2.move(angles[2]);
  s3.move(angles[3]);
  console.log(angles);
}
