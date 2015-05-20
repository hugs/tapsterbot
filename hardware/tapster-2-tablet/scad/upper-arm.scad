// Description: Upper arm for Tapster 2 Plus
// Project home: http://tapsterbot.com

// Slicer settings
// Infill density: 0.5
// Fill pattern: line
// Top/bottom fill pattern: rectilinear

beam_width     = 8;
hole_diameter  = 5.25;
hole_radius    = hole_diameter / 2;
beam_length = beam_width * 20.5;



difference() {
    // Draw the beam...
    union(){
        cube([beam_length-16,beam_width,beam_width*2]);

        translate([0,0,0])
        cube([beam_length,beam_width,beam_width+4]);

        translate([0,6,0])
        cube([32,4,16]);

        translate([32.0,4.35,0])
        rotate([0,0,45])
        cube([4,4,16]);

        //rotate(90)
        //translate([-8,-beam_length,0])
        //cube([24,8,8]);
    }

    translate([-2,5,32])
    rotate([0,45,0])
    cube([32,32,32], center=true);

    translate([-2,5,-16])
    rotate([0,45,0])
    cube([32,32,32], center=true);

    // Servo mount - center
    rotate([90,0,0])
    translate([16,8,-1])
    cylinder(r=4.2, h=5, $fn=30);

    // Hole #1 for servo
    rotate([90,0,0])
    translate([4,8,-12])
    cylinder(r=1.3, h=14, $fn=30);

    // Hole #2 for servo
    rotate([90,0,0])
    translate([28,8,-12])
    cylinder(r=1.3, h=14, $fn=30);

    rotate([90,0,0])
    translate([beam_length-4,8,-14])
    cylinder(r=hole_radius, h=20, $fn=30);

}