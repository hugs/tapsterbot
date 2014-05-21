use <vendor/Write.scad>

beam_width    = 8;
hole_diameter = 5.1;
hole_radius   = hole_diameter / 2;
number_of_holes = 10;


difference() {
	union() {
	  cube([90,50,4], center=true);
	
	  translate([0,0,2])
	  write("Diera",  font="vendor/orbitron.dxf", t=3, h=15, center=true);
	
	}

	translate([-40,-20,-7])
	rotate([0,0,90])
	holes(5);
	
	translate([40,-20,-7])
	rotate([0,0,90])
	holes(5);

}

module holes(number_of_holes) {
    beam_length = number_of_holes * 8;
    for (x=[beam_width : beam_width : beam_length]) {
        translate([x-4,0,2])
        cylinder(r=hole_radius, h=12, $fn=30);
    }
}

