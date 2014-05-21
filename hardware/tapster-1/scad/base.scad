// Description: "Lego-compatible grid beam"
// Project home: http://bitbeam.org

// Each hole is 8mm apart from each other
// The holes are 5.1 mm in diameter.

beam_width    = 8;
hole_diameter = 5.1;
hole_radius   = hole_diameter / 2;

module beam(number_of_holes) {
    beam_length = number_of_holes * 8;
    for (x=[beam_width/2 : beam_width*1 : beam_length]) {
        translate([x-4,beam_width/2-4,-2])
        cylinder(r=hole_radius, h=12, $fn=30);
    }
}

module side_beam(number_of_holes) {
    beam_length = number_of_holes * 8;
    for (x=[beam_width/2 : beam_width*4 : beam_length]) {
        translate([x-4,beam_width/2-4,-2])
        cylinder(r=hole_radius, h=12, $fn=30);
    }
}

// Uncomment 'projection' to create 2D (DXF-able) version
//projection(cut=true, center=true) {
difference(){
    cylinder(r=beam_width*12+1, h=4, $fn=6);
    //cylinder(r=beam_width*11+2, h=4, $fn=30);

    rotate(0)
    translate([-16,-beam_width*10,-2])
    side_beam(5);
	
    rotate(120)
    translate([-16,-beam_width*10,-2])
    side_beam(5);

    rotate(240)
    translate([-16,-beam_width*10,-2])
    side_beam(5);

    box();
}
//}

module box(){
    translate([-beam_width*4,-beam_width*8,-2])
    beam(9);

    translate([-beam_width*4,beam_width*10,-2])
    beam(9);

    rotate(90)
    translate([-beam_width*7,beam_width*5,-2])
    beam(17);

    rotate(90)
    translate([-beam_width*7,-beam_width*5,-2])
    beam(17);
}
