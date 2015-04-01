// Description: "Joint for Tapster 2 Plus"
// Project home: http://tapsterbot.com

hole_diameter  = 5.1;
hole_radius    = hole_diameter / 2;
tolerance      = 0.2;

difference(){
    cube([18,10,8]);

    translate([8,3-(tolerance/2),-1])
    cube([16,4+tolerance,10]);

    rotate([90,0,0])
    translate([14,4,-14])
    cylinder(r=hole_radius, h=16, $fn=30);

    translate([4,5,-4])
    cylinder(r=hole_radius, h=16, $fn=30);

    translate([0,-4,-1])
    rotate([0,0,45])
    cube([5,5,10]);

    translate([0,7,-1])
    rotate([0,0,45])
    cube([5,5,10]);
}