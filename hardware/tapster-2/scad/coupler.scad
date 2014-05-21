// rod: 6-32 threaded rod: http://store.curiousinventor.com/guides/tap_drill/

// Hole for either 6-32 or M3 bolt
servo_hole_radius = 3.5/2;

difference(){
    cylinder(r=4.5, h=20.5, $fn=45);

    // magnet
    translate([0,0,11.9])
    cylinder(r=2.6, h=9, $fn=45);

    // threaded rod mount	
    translate([0,0,-1])
    cylinder(r=servo_hole_radius, h=13, $fn=45);
}
