beam_width    = 8;
hole_diameter = 5.1;
hole_radius   = hole_diameter / 2;

plate_radius = beam_width * 4;
distance_of_edge_from_center = sqrt(pow(plate_radius,2)-pow(plate_radius/2,2));

module beam_holes(number_of_holes, step=8) {
    beam_length = number_of_holes * 8;
    // Cut the holes
    for (x=[4 : step : beam_length]) {
        translate([x-4,0,2])
        cylinder(r=2.55, h=12, $fn=30);
    }
}

union(){

    difference(){
        cylinder(r=13, h=20, $fn=6);

        translate([0,20,16])
        rotate([90,0,0])
        cylinder(r=1.5, h=40, $fn=30);

        translate([0,-8,0])
        cube([6.5,3,60], center=true);

        translate([0,8,0])
        cube([6.5,3,60], center=true);

        translate([-4.2,-4.2,-12])
        cube([8.4,8.4,50]);
    }

    difference(){
        // Base plate
        cylinder(r=plate_radius, h=4, $fn=6);

        rotate(90)
        translate([0,0,-5])
        center_connectors();

        translate([0,-8,0])
        cube([6.5,3,60], center=true);

        translate([0,8,0])
        cube([6.5,3,60], center=true);

        translate([-4.2,-4.2,-12])
        cube([8.4,8.4,50]);
    }
}


module center_connectors() {
    translate([8,16,0])
    rotate(a=0)
    beam_holes(10,step=8*8);

    rotate(a=120)
    translate([8,16,0])
    beam_holes(10,step=8*8);

    rotate(a=240)
    translate([8,16,0])
    beam_holes(10,step=8*8);
}
