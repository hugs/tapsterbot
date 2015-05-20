// Description: Top plate for Tapster 2 Tablet
// Project home: http://tapsterbot.com

// Slicer settings
// Infill density: 0.5
// Fill pattern: line
// Top/bottom fill pattern: rectilinear

beam_width    = 8;
hole_diameter = 5.3;
hole_radius   = hole_diameter / 2;

plate_radius = beam_width * 26;
distance_of_edge_from_center = sqrt(pow(plate_radius,2)-pow(plate_radius/2,2));
joint_hole_center = distance_of_edge_from_center-15;

module beam(number_of_holes, step=8) {
    beam_length = number_of_holes * 8;
    for (x=[beam_width/2 : step : beam_length]) {
        translate([x-4,beam_width/2-4,-4])
        cylinder(r=hole_radius, h=16, $fn=30);
    }
}


module joint(){   
    translate([-16,-joint_hole_center,-10])
    cylinder(r=hole_radius, h=25, $fn=30);

    translate([16,-joint_hole_center,-10])
    cylinder(r=hole_radius, h=25, $fn=30);
}

module side_connectors() {
    joint();

    rotate(120)
    joint();

    rotate(240)
    joint();
}


// Uncomment 'projection' to create 2D (DXF-able) version
//projection(cut=true) {
union(){
    difference(){
        // Base plate
        cylinder(r=plate_radius, h=6, $fn=6);

        // Center hole
        translate([0,0,-2])
        cylinder(r=7, h=12, $fn=30);

        // Delta-bot leg mounting holes
        side_connectors();

        rotate(90)
        center_connectors();

        rotate(0)
        box();
    }

    rotate([0,0,180])
    translate([0,-50,4])
    linear_extrude(center=true, height=8) import("tapster.dxf");
}
//}


module box() {
        // Bottom row
        for (x=[8 :  beam_width * 8 : beam_width * 9]) {
            translate([x-8*5, -joint_hole_center+32, -10])
            cylinder(r=hole_radius, h=20, $fn=30);
        }

        // Top row
        for (x=[8 : beam_width * 8 : beam_width * 9]) {
            translate([x-8*5, -joint_hole_center+8*8+32, -10])
            cylinder(r=hole_radius, h=20, $fn=30);
       }
}

module center_connectors() {
    translate([8,16,0])
    rotate(a=0)
    beam(10,step=8*8);

    rotate(a=120)
    translate([8,16,0])
    beam(10,step=8*8);

    rotate(a=240)
    translate([8,16,0])
    beam(10,step=8*8);
}
