// Description: Base plate for Tapster 2 Plus
// Project home: http://tapsterbot.com

beam_width    = 8;
hole_diameter = 5.3;
hole_radius   = hole_diameter / 2;

plate_radius = beam_width * 24;
distance_of_edge_from_center = sqrt(pow(plate_radius,2)-pow(plate_radius/2,2));
joint_hole_center = distance_of_edge_from_center-4;

echo("distance_of_edge_from_center=", distance_of_edge_from_center);

module beam(number_of_holes) {
    beam_length = number_of_holes * 8;
    for (x=[beam_width/2 : beam_width*2 : beam_length]) {
        translate([x-4,beam_width/2-4,-4])
        cylinder(r=hole_radius, h=20, $fn=30);
    }
}

module joint(){
    translate([-20.5-4,-distance_of_edge_from_center-1,-4])
    cube([5,beam_width+1.1,16]);

    translate([15.5+4,-distance_of_edge_from_center-1,-4])
    cube([5,beam_width+1.1,16]);

    translate([0,-joint_hole_center,-10])
    cylinder(r=hole_radius, h=25, $fn=30);
}

// Uncomment 'projection' to create 2D (DXF-able) version
//projection(cut=true, center=true) {
difference(){
    cylinder(r=plate_radius, h=8, $fn=6);
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
    translate([-beam_width*10,-beam_width*18+5,-2])
    beam(21);

    translate([-beam_width*10,beam_width*18+5,-2])
    beam(21);

    rotate(90)
    translate([-beam_width*17+5,beam_width*10+5,-2])
    beam(35);

    rotate(90)
    translate([-beam_width*17+5,-beam_width*11,-2])
    beam(35);
}