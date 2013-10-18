// Description: "LEGO Technic-compatible gridbeam"
// Project home: http://bitbeam.org

// Each bitbeam is 8mm inches wide. 
// Center of each hole is 8mm apart from each other
// Holes are 5.1 mm in diameter.

// Mini
//beam_width     = 4;
//hole_diameter  = 2.2;

// Standard
beam_width     = 8;
hole_diameter  = 5.1;

// Open Structures
//beam_width     = 10;
//hole_diameter  = 5.6;

hole_radius    = hole_diameter / 2;

module beam(number_of_holes) {
    beam_length = number_of_holes * beam_width;
    difference() {
        // Draw the beam...
        cube([beam_length,beam_width,beam_width]);
    
        // Cut the holes...
        for (x=[beam_width/2 : beam_width : beam_length]) {
            translate([x,beam_width/2,-2])
            cylinder(r=hole_radius, h=beam_width*1.5, $fn=30);
        }
        for (x=[beam_width/2 : beam_width : beam_length]) {
            rotate([90,0,0])
            translate([x,beam_width/2,-beam_width*1.5])
            cylinder(r=hole_radius, h=beam_width*2, $fn=30);
        }

        // Optional through-hole
        //rotate([0,90,0])
        //translate([-4,beam_width/2,-2])
        //cylinder(r=hole_radius, h=number_of_holes*beam_width+4, $fn=30);
        }
}

beam(9);
