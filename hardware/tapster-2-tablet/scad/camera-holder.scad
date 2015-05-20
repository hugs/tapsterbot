beam_width    = 8;
hole_diameter = 5.1;
hole_radius   = hole_diameter / 2;


union() {
    difference() {
        cube([32,14,20], center=true);

        translate([0,0,-16])
        cube([40,16,20], center=true);

        translate([-27,0,0])
        rotate([0,90,0])
        cube([8.4,8.4,50], center=true);

        translate([8,0,-20])
        cylinder(r=4, h=40, $fn=30);

        translate([-12.5,0,0])
        cylinder(r=1.5, h=40, $fn=30);

        translate([10,0,14])
        cube(20,16,14, center=true);

        translate([-16,0,7])
        cube([17,6.5,3], center=true);

    }

}