// Description: "Lego-compatible grid beam"
// Project home: http://bitbeam.org

// Each hole is 8mm apart from each other
// The holes are 5.1 mm in diameter.

beam_width = 8;
hole_diameter = 5.1;
hole_radius = hole_diameter / 2;

module beam(number_of_holes) {
    beam_length = number_of_holes * beam_width;
	difference() {
		// Draw the beam...
		cube([beam_length-2,8,beam_width]);
    
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
	    cylinder(r=12, h=7, $fn=6);	
	
	    translate([0,0,-2])
	    cylinder(r=4.6, h=10, $fn=30);
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
