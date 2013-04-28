use <arduino.scad>

beam_width = 8;

// Uncomment 'projection' to create 2D (DXF-able) version
//projection(cut=true) {
    difference(){

        // Base plate
        cube([8*9, beam_width * 9, 4]);
	
        // Bottom row
        for (x=[8 : 8 : beam_width * 10]) {
            translate([x-4, beam_width/2, -10])
            cylinder(r=2.55, h=20, $fn=25);
        }
	
        // Top row
        for (x=[8 : 8 : beam_width * 10]) {
            translate([x-4, (beam_width/2) + beam_width * 8, -10])
            cylinder(r=2.55, h=20, $fn=25);
	   }

        translate([17,60,0]) MountingHoles();
    }
//}

// Uncomment next line if you want to see the entire board
//translate([17,60,6]) Arduino();
