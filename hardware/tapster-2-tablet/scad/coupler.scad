// Description: "Coupler for Tapster 2 Plus"
// Project home: http://tapsterbot.com

hole_diameter  = 5.1;
hole_radius    = hole_diameter / 2;
tolerance      = 0.2;

difference(){
    cylinder(r=4.5, h=10, $fn=45);

    // threaded rod mount
    translate([0,0,-1])
    cylinder(r=2.5, h=10, $fn=45);
}

translate([0,0,15])
difference(){
    cube([8,4-tolerance,10], center=true);

    translate([0,8,1])
    rotate([90,0,0])
    cylinder(r=hole_radius, h=16, $fn=30);
}