// Description: "Lego-compatible grid beam"
// Project home: http://bitbeam.org

// Each bitbeam is 8mm inches wide. 
// Center of each hole is 8mm apart from each other
// Holes are 5.1 mm in diameter.

beam_width = 8;
hole_diameter = 5.1;
hole_radius = hole_diameter / 2;

module beam(number_of_holes) {
    beam_length = number_of_holes * beam_width;
    // Cut the holes...
    for (x=[4 : 8 : beam_length]) {
        translate([x,4,-2])
        cylinder(r=hole_radius, h=10, $fn=30);
    }
}

// Uncomment 'projection' to create 2D (DXF-able) version
//projection(cut=true) {
	difference(){
        trapezoid();
		
        translate([8*2,8,0])
        rotate(90)
        beam(3);

        translate([8*15,8,0])
        rotate(90)
        beam(3);
		
        translate([8*28,8,0])
        rotate(90)
        beam(3);
    }
//}


module trapezoid(){
    b = 4;
    h = 4;
    length = 8*29;

    rotate(a=[90,0,90])
    linear_extrude(height = length, convexity = 10, twist = 0)
    polygon(points=[[0,0],[40,0],[36,4],[4,4]]);
}






