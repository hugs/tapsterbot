

beam_width    = 8;
hole_diameter = 5.25;
hole_radius   = hole_diameter / 2;

clipping_distance = 26;

difference(){
  cylinder(r=56/2, h=9, $fn=3, center=true);

  translate([0,0,-10])
  cylinder(r=4.3, h=20, $fn=30);


  rotate([60,90,0])
  translate([0,0,0])
  cylinder(r=1.5, h=20, $fn=30);

  rotate(-60)
  translate([10,0,0])
  cube([3,6.5,30], center=true);

  translate([clipping_distance,0,0])
  cube([16,16,10], center=true);

  rotate(120)
  translate([clipping_distance,0,0])
  cube([16,16,10], center=true);

  rotate(240)
  translate([clipping_distance,0,0])
  cube([16,16,10], center=true);

  

  rotate(90)
  translate([-12,6,0])
  beam(3);


  rotate(30)
  translate([-12,-14,0])
  beam(3);

  rotate(150)
  translate([-12,-14,0])
  beam(3);

}


module beam(number_of_holes) {
    beam_length = number_of_holes * beam_width;
		for (x=[4 : 16 : beam_length]) {
			//rotate([90,0,0])
			translate([x,beam_width/2,-10])
			cylinder(r=hole_radius, h=20, $fn=30);
         }
}     

