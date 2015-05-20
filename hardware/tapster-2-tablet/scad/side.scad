// Description: Side plate for Tapster 2 Tablet
// Project home: http://tapsterbot.com

beam_width = 8;
hole_diameter = 5.3;
hole_radius = hole_diameter / 2;

margin_from_bottom = 10;
width_of_bracket = 30;
width_of_base_plate = 6.35;

plate_length = margin_from_bottom +
               width_of_bracket +
               width_of_base_plate +
               480 +
               width_of_base_plate +
               width_of_bracket;
echo("Plate length: ", plate_length);

// Uncomment 'projection' to create 2D (DXF-able) version
//projection(cut=true) {
difference(){
    cube([plate_length, 76.2, 15.875]);

    // Bottom row A
    translate([25, 22.1, -10])
    cylinder(r=hole_radius, h=40, $fn=30);

    translate([25, 76.2-22.1, -10])
    cylinder(r=hole_radius, h=40, $fn=30);

    // Bottom row B
    translate([25+6.35+30, 22.1, -10])
    cylinder(r=hole_radius, h=40, $fn=30);

    translate([25+6.35+30, 76.2-22.1, -10])
    cylinder(r=hole_radius, h=40, $fn=30);

    /*
    // Fiducial #1
    translate([plate_length/2 + 30 , 22.1, -10])
    cylinder(r=hole_radius, h=40, $fn=30);

    translate([plate_length/2 + 30, 76.2-22.1, -10])
    cylinder(r=hole_radius, h=40, $fn=30);

    // Fiducial #2
    translate([plate_length/2 - 30, 22.1, -10])
    cylinder(r=hole_radius, h=40, $fn=30);

    translate([plate_length/2 - 30, 76.2-22.1, -10])
    cylinder(r=hole_radius, h=40, $fn=30);
    */

    // Top row C
    translate([plate_length-15, 22.1, -10])
    cylinder(r=hole_radius, h=40, $fn=30);

    translate([plate_length-15, 76.2-22.1, -10])
    cylinder(r=hole_radius, h=40, $fn=30);

    // Top row D
    translate([plate_length-15-6.35-30, 22.1, -10])
    cylinder(r=hole_radius, h=40, $fn=30);

    translate([plate_length-15-6.35-30, 76.2-22.1, -10])
    cylinder(r=hole_radius, h=40, $fn=30);
}
//}