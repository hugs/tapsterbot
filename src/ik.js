// Original code from
// http://forums.trossenrobotics.com/tutorials/introduction-129/delta-robot-kinematics-3276/

(function(exports){

    // Specific geometry for bitbeambot:
    // http://flic.kr/p/cYaQah
    var e=83.138;
    var f=103.9;
    var re = 8 * 18;
    var rf = 8 * 7;
  
    exports.updateSize = function(parameters) {
      e = parameters[0];
      f = parameters[1];
      re = parameters[2];
      rf = parameters[3];
      exports.e = e;
      exports.f = f;
      exports.re = re;
      exports.rf = rf;
    }
    
    exports.getSize = function() {
      return Array(e,f,re,rf);
    }

    // Trigonometric constants
    var s=165*2;
    var sqrt3=Math.sqrt(3.0);
    var pi=3.141592653;
    var sin120=sqrt3/2.0;
    var cos120=-0.5;
    var tan60=sqrt3;
    var sin30=0.5;
    var tan30=1.0/sqrt3;

    // Forward kinematics: (theta1, theta2, theta3) -> (x0, y0, z0)
    //   Returned {error code,theta1,theta2,theta3}
    exports.forward = function(theta1, theta2, theta3) {
      var x0 = 0.0;
      var y0 = 0.0;
      var z0 = 0.0;
      
      var t = (f-e)*tan30/2.0;
      var dtr = pi/180.0;
      
      theta1 *= dtr;
      theta2 *= dtr;
      theta3 *= dtr;
      
      var y1 = -(t+rf*Math.cos(theta1));
      var z1 = -rf*Math.sin(theta1);
      
      var y2 = (t+rf*Math.cos(theta2))*sin30;
      var x2 = y2*tan60;
      var z2 = -rf*Math.sin(theta2);
      
      var y3 = (t+rf*Math.cos(theta3))*sin30;
      var x3 = -y3*tan60;
      var z3 = -rf*Math.sin(theta3);
      
      var dnm = (y2-y1)*x3-(y3-y1)*x2;
      
      var w1 = y1*y1 + z1*z1;
      var w2 = x2*x2 + y2*y2 + z2*z2;
      var w3 = x3*x3 + y3*y3 + z3*z3;
      
      // x = (a1*z + b1)/dnm
      var a1 = (z2-z1)*(y3-y1)-(z3-z1)*(y2-y1);
      var b1=-((w2-w1)*(y3-y1)-(w3-w1)*(y2-y1))/2.0;

      // y = (a2*z + b2)/dnm;
      var a2 = -(z2-z1)*x3+(z3-z1)*x2;
      var b2=((w2-w1)*x3-(w3-w1)*x2)/2.0;

      // a*z^2 + b*z + c = 0
      var a=a1*a1+a2*a2+dnm*dnm;
      var b=2.0*(a1*b1+a2*(b2-y1*dnm)-z1*dnm*dnm);
      var c=(b2-y1*dnm)*(b2-y1*dnm)+b1*b1+dnm*dnm*(z1*z1-re*re);

      // discriminant
      var d = b*b - 4.0*a*c;
      if (d<0.0) return Array(1,0,0,0); // non-existing povar. return error,x,y,z

      z0 = -0.5*(b+Math.sqrt(d))/a;
      x0=(a1*z0+b1)/dnm;
      y0=(a2*z0+b2)/dnm;

      return Array(0,x0,y0,z0);
    }

    // Inverse kinematics
    // Helper functions, calculates angle theta1 (for YZ-pane)
    delta_calcAngleYZ = function(x0, y0, z0) {
      var y1 = -0.5*0.57735*f; // f/2 * tg 30
          y0 -= 0.5*0.57735*e; // shift center to edge
      // z = a + b*y
      var a = (x0*x0+y0*y0+z0*z0+rf*rf-re*re-y1*y1)/(2.0*z0);
      var b = (y1-y0)/z0;

      // discriminant
      var d = -(a+b*y1)*(a+b*y1)+rf*(b*b*rf+rf);
      if (d<0) return Array(1,0); // non-existing povar.  return error, theta

      var yj = (y1-a*b-Math.sqrt(d))/(b*b+1); // choosing outer povar
      var zj=a+b*yj;
      theta=Math.atan(-zj/(y1-yj))*180.0/pi+((yj>y1)?180.0:0.0);

      return Array(0,theta); // return error, theta
    }

    exports.inverse = function(x0, y0, z0) {
      var theta1 = 0;
      var theta2 = 0;
      var theta3 = 0;
      var status = delta_calcAngleYZ(x0,y0,z0);

      if (status[0]==0) { 
        theta1 = status[1];
        status = delta_calcAngleYZ(x0*cos120+y0*sin120,y0*cos120-x0*sin120,z0,theta2);
      }
      if (status[0]==0) {
        theta2 = status[1];
        status = delta_calcAngleYZ(x0*cos120-y0*sin120,y0*cos120+x0*sin120,z0,theta3);
      }
      theta3 = status[1];

      return Array(status[0],theta1,theta2,theta3);
    }
}(typeof exports === 'undefined' ? this.ik = {} : exports));
