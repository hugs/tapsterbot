// Description: "Tapster Base Plate"
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
    translate([-20.5,-85,-4])
    cube([5,9.1,12]);

    translate([15.5,-85,-4])
    cube([5,9.1,12]);

    translate([0,-beam_width*10,-10])
    cylinder(r=hole_radius, h=25, $fn=30);
}

// Uncomment 'projection' to create 2D (DXF-able) version
//projection(cut=true, center=true) {
difference(){
    cylinder(r=beam_width*12+1, h=4, $fn=6);
    //cylinder(r=beam_width*11+2, h=4, $fn=30);

    joint();
	
    rotate(120)
    joint();

    rotate(240)
    joint();

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
