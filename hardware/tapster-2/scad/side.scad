// Description: "Tapster Side-plate"
// Project home: http://tapsterbot.com

// Slicer settings
// Infill density: 0.2
// Brim: 4mm
// Fill pattern: honeycomb

beam_width = 8;
hole_diameter = 5.3;
hole_radius = hole_diameter / 2;

//// From: http://www.mcmaster.com/#90760a411/=p1d69p
//nut_width = 7.9375;
//nut_depth = 2.77813;
//nut_clearance = 0.5;

difference(){
    // Main sheet:
    cube([29*beam_width,39.75,beam_width], center=true);

    ////////////////////////////////////
    // Left
    ////////////////////////////////////
    translate([-14.5*beam_width,0,0])
    cube([8,32.5,12], center=true);

    // Holes for nuts:
    // From: http://www.mcmaster.com/#90760a411/=p1d69p
    translate([-13*beam_width+2,0,0])
    cube([3.5,8.5,16], center=true);


    // Holes for mounting bolts:
    translate([-14*beam_width+6,0,0])
    rotate([90,0,90])
    cylinder(r=hole_radius, h=29, $fn=30, center=true);

    ////////////////////////////////////
    // Right
    ////////////////////////////////////
    translate([14.5*beam_width,0,0])
    cube([8,32.5,12], center=true);

    // Holes for nuts:
    translate([13*beam_width-2,0,0])
    cube([3.5,8.5,16], center=true);

    // Holes for mounting bolts:
    translate([14*beam_width-6,0,0])
    rotate([90,0,90])
    cylinder(r=hole_radius, h=29, $fn=30, center=true);

    ////////////////////////////////////
    // Center
    ////////////////////////////////////
    //translate([0,0,2])
    //cube([22*beam_width,24,6], center=true);
}