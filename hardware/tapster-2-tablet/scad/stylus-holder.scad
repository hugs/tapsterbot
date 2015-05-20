// Description: Tablet stylus holder for Tapster 2 Plus
// Project home: http://tapsterbot.com

beam_width    = 8;
hole_diameter = 5.1;
hole_radius   = hole_diameter / 2;

module beam(number_of_holes) {
    beam_length = number_of_holes * beam_width;
    difference() {
        // Draw the beam...
        translate([2,0,0])
        cube([beam_length-4,8,beam_width]);

        // Cut the holes...
        for (x=[10 : beam_width : beam_length]) {
            rotate([90,0,0])
            translate([x,beam_width/2,-10])
            cylinder(r=hole_radius, h=12, $fn=30);
        }
    }
}

union() {
  difference(){
      cylinder(r=11, h=8, $fn=30);

      translate([0,0,-5])
      cylinder(r=4.3, h=20, $fn=30);

      translate([0,0,4])
      rotate([60,90,0])
      cylinder(r=1.5, h=20, $fn=30);

      rotate(-60)
      translate([7,0,0])
      cube([3,6.5,30], center=true);
  }

  translate([6,-4,0])
  beam(2);

  rotate(120)
  translate([6,-4,0])
  beam(2);

  rotate(240)
  translate([6,-4,0])
  beam(2);
}