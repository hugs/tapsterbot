// Description: "Lego-compatible grid beam"
// Project home: http://bitbeam.org

// Each bitbeam is 8mm inches wide. 
// Center of each hole is 8mm apart from each other
// Holes are 5.1 mm in diameter.

beam_width = 8;
hole_diameter = 5.1;
hole_radius = hole_diameter / 2;

module beam(number_of_holes) {
    beam_length = number_of_holes * 8;
        difference(){
            // Draw the beam...
            cube([beam_length,beam_width,beam_width/2]);
    
            // Cut the holes...
            for (x=[4 : 8 : beam_length]) {
                translate([x,4,-2])
		       cylinder(r=hole_radius, h=10, $fn=30);
            }
        }
}


beam(11);