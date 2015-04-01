// Description: Side plate for Tapster 2 Plus
// Project home: http://tapsterbot.com

// Slicer settings
// Infill density: 0.2
// Brim: 4mm
// Fill pattern: honeycomb

beam_width = 8;
hole_diameter = 5.3;
hole_radius = hole_diameter / 2;
plate_length = 34;
plate_width = beam_width*6;

//// From: http://www.mcmaster.com/#90760a411/=p1d69p
//nut_width = 7.9375;
//nut_depth = 2.77813;
//nut_clearance = 0.5;

difference(){
    // Main sheet:
    cube([plate_length*beam_width, plate_width - 0.25, beam_width], center=true);

    ////////////////////////////////////
    // Left
    ////////////////////////////////////
    translate([-plate_length/2*beam_width,0,0])
    cube([12, plate_width - 8 + 0.5 ,12], center=true);

    // Holes for nuts:
    // From: http://www.mcmaster.com/#90760a411/=p1d69p
    translate([-(plate_length/2 - 1.5)*beam_width+2,0,0])
    cube([3.5,8.5,16], center=true);


    // Holes for mounting bolts:
    translate([-(plate_length/2-.5)*beam_width+2,0,0])
    rotate([90,0,90])
    cylinder(r=hole_radius, h=37, $fn=30, center=true);

    ////////////////////////////////////
    // Right
    ////////////////////////////////////
    translate([plate_length/2*beam_width,0,0])
    cube([12, plate_width - 8 + 0.5, 12], center=true);

    // Holes for nuts:
    translate([(plate_length/2 - 1.5)*beam_width-2,0,0])
    cube([3.5,8.5,16], center=true);

    // Holes for mounting bolts:
    translate([(plate_length/2-.5)*beam_width-2,0,0])
    rotate([90,0,90])
    cylinder(r=hole_radius, h=37, $fn=30, center=true);
}