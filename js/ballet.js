/* More dance routines */
(function(exports){
  var x = 0;
  var y = 0;
  var z = -165;
  var timeToCircle = 1500;
  var timeToUpDown = 1000;
  var startTime = new Date();
  var radius = 42;
  var zStart = z;
  var zTarget = -140;
  var speed = 20;
  var zStartTime;
  doingUpDown = false;
  doingCircle = false;

  startAnim = function () {
    var anim = setInterval(function () {
      if (doingCircle) { interpolateCircle(); }
      if (doingUpDown) { interpolateUpDown(); }
      if (doingCircle || doingUpDown) { go(x, y, z); }
    }, speed);
  }
  startAnim();

  interpolateCircle = function () {
    var millsSinceStart = (new Date()) - startTime;

    var pct = millsSinceStart / timeToCircle;

    var ang = (Math.PI * 2) * pct;

    x = Math.sin(ang) * radius;
    y = Math.cos(ang) * radius;
  }

  interpolateUpDown = function () {
    if (zStartTime === undefined) { zStartTime = new Date(); }
    var millsSinceStart = (new Date()) - zStartTime;

    var pct = millsSinceStart / timeToUpDown;

    // var upDown = (pct % 2 < 1) ? -1 : 1;
    // z += upDown;

    z = (zTarget - zStart) * pct + zStart;

    if (pct > 1) {
      zStartTime = undefined;
      p = zStart; zStart = zTarget; zTarget = p;
    }
  }

  exports.startCircle = function () { doingCircle = true; }
  exports.endCircle = function () { doingCircle = false; }

  exports.startUpDown = function () { doingUpDown = true; }
  exports.endUpDown = function () { doingUpDown = false; }
}(typeof exports === 'undefined' ? this.ik = {} : exports));