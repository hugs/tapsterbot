hole_diameter = 5.3;
hole_radius   = hole_diameter / 2;

difference(){
    cube([76.2,30,30]);

    translate([-2,-2,-2])
    rotate([45,0,0])
    cube([80,50,25]);

    translate([8,-10,5])
    cube([76.2-16,34,34]);

    translate([22.1,15,-5])
    cylinder(r=hole_radius, h=20, $fn=30);

    translate([76.2-22.1,15,-5])
    cylinder(r=hole_radius, h=20, $fn=30);

    translate([22.1,-20,15])
    rotate([0,90,90])
    cylinder(r=hole_radius, h=80, $fn=30);

    translate([76.2-22.1,-20,15])
    rotate([0,90,90])
    cylinder(r=hole_radius, h=80, $fn=30);

}