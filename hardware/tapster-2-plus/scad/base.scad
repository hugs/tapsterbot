// Description: Base plate for Tapster 2 Plus
// Project home: http://tapsterbot.com

beam_width    = 8;
hole_diameter = 5.3;
hole_radius   = hole_diameter / 2;

plate_radius = beam_width * 14;
distance_of_edge_from_center = sqrt(pow(plate_radius,2)-pow(plate_radius/2,2));
joint_hole_center = distance_of_edge_from_center-4;

module beam(number_of_holes) {
    beam_length = number_of_holes * 8;
    for (x=[beam_width/2 : beam_width : beam_length]) {
        translate([x-4,beam_width/2-4,-2])
        cylinder(r=hole_radius, h=12, $fn=30);
    }
}

module joint(){
    translate([-20.5-4,-distance_of_edge_from_center-1,-4])
    cube([5,beam_width+1.1,12]);

    translate([15.5+4,-distance_of_edge_from_center-1,-4])
    cube([5,beam_width+1.1,12]);

    translate([0,-joint_hole_center,-10])
    cylinder(r=hole_radius, h=25, $fn=30);
}

// Uncomment 'projection' to create 2D (DXF-able) version
//projection(cut=true, center=true) {
difference(){
    cylinder(r=plate_radius, h=6, $fn=6);
    //cylinder(r=beam_width*11+2, h=4, $fn=30);

    joint();

    rotate(120)
    joint();

    rotate(240)
    joint();

    box();
    //grid();
}
//}

module box(){
    translate([-beam_width*5,-beam_width*10+5,-2])
    beam(11);

    translate([-beam_width*5,beam_width*11+5,-2])
    beam(11);

    rotate(90)
    translate([-beam_width*9+5,beam_width*6,-2])
    beam(20);

    rotate(90)
    translate([-beam_width*9+5,-beam_width*6,-2])
    beam(20);
}

module grid(){
    translate([-beam_width*7,-beam_width*10,-2])
    beam(15);

    translate([-beam_width*8,-beam_width*8,-2])
    beam(17);

    translate([-beam_width*9,-beam_width*6,-2])
    beam(19);

    translate([-beam_width*10,-beam_width*4,-2])
    beam(21);

    translate([-beam_width*11,-beam_width*2,-2])
    beam(23);

    translate([-beam_width*12,-beam_width*0,-2])
    beam(25);

    translate([-beam_width*11,beam_width*2,-2])
    beam(23);

    translate([-beam_width*10,beam_width*4,-2])
    beam(21);

    translate([-beam_width*9,beam_width*6,-2])
    beam(19);

    translate([-beam_width*8,beam_width*8,-2])
    beam(17);

    translate([-beam_width*7,beam_width*10,-2])
    beam(15);

    translate([-beam_width*6,beam_width*12,-2])
    beam(13);

}

module grid2(){
    translate([-beam_width*7,-beam_width*11,-2])
    beam(15);

    translate([-beam_width*9,-beam_width*9,-2])
    beam(19);

    translate([-beam_width*11,-beam_width*7,-2])
    beam(23);

    translate([-beam_width*11,-beam_width*5,-2])
    beam(23);

    translate([-beam_width*11,-beam_width*3,-2])
    beam(23);

    translate([-beam_width*11,-beam_width*1,-2])
    beam(23);

    translate([-beam_width*11,-beam_width*-1,-2])
    beam(23);

   ////////

    translate([-beam_width*11,beam_width*3,-2])
    beam(23);

    translate([-beam_width*11,beam_width*5,-2])
    beam(23);

    translate([-beam_width*9,beam_width*7,-2])
    beam(19);

    translate([-beam_width*7,beam_width*9,-2])
    beam(15);

    translate([-beam_width*6,beam_width*11,-2])
    beam(14);

}