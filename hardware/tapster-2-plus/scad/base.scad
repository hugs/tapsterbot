// Description: Tapster Base Plate - plus sized for iPhone and Note 4
// Project home: http://tapsterbot.com

beam_width    = 8;
hole_diameter = 5.2;
hole_radius   = hole_diameter / 2;

module beam(number_of_holes) {
    beam_length = number_of_holes * 8;
    for (x=[beam_width/2 : beam_width*1 : beam_length]) {
        translate([x-4,beam_width/2-4,-2])
        cylinder(r=hole_radius, h=12, $fn=30);
    }
}

module joint(){
    translate([-20.5,-85-13,-4])
    cube([5,9.1,12]);

    translate([15.5,-85-13,-4])
    cube([5,9.1,12]);

    translate([0,-beam_width*11.5,-10])
    cylinder(r=hole_radius, h=25, $fn=30);
}

// Uncomment 'projection' to create 2D (DXF-able) version
projection(cut=true, center=true) {
difference(){
    cylinder(r=beam_width*14, h=4, $fn=6);
    //cylinder(r=beam_width*11+2, h=4, $fn=30);

    joint();
	
    rotate(120)
    joint();

    rotate(240)
    joint();

    box();
}
}

module box(){
    translate([-beam_width*5,-beam_width*10+4,-2])
    beam(11);

    translate([-beam_width*5,beam_width*11+4,-2])
    beam(11);

    rotate(90)
    translate([-beam_width*9+4,beam_width*6,-2])
    beam(20);

    rotate(90)
    translate([-beam_width*9+4,-beam_width*6,-2])
    beam(20);
}
