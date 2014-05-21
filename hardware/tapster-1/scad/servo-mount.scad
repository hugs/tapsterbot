// From: http://www.servocity.com/html/hs-311_standard.html
A = 19.82;
B = 13.47;
C = 33.79;
D = 10.17;
E = 9.66;
F = 30.22;
G = 11.68;
H = 26.67;
J = 52.84;
K = 9.35;
L = 4.38;
M = 39.88;
X = 3.05;

// Clearance hole for either 6-32 or M3 bolt
servo_hole_radius = 3.8/2;

// Bitbeam (and Lego Technic) beam width
beam_width = 8;

// Bitbeam (and Lego Technic) hole size
hole_diameter = 5.2;
hole_radius   = hole_diameter / 2;

module servo() {
    x1 = (J-(B+C))/2;
    y1 = (A-D)/2;

    x2 = x1+B+C;
    y2 = y1;

    // 2 mounting holes
    translate([x1,y1,-2])
    cylinder(r=servo_hole_radius, h=12, $fn=30);

    translate([x2,y2,-2])
    cylinder(r=servo_hole_radius, h=12, $fn=30);

    // servo hole
    x_servo = (J-40.5)/2;
    y_servo = 0;
    translate([x_servo, y_servo,-2])
    cube([40.5,20,12]);
}


module box() {
    difference() {
        cube([7*beam_width,2.5*beam_width-1,8]); 

        for (x=[beam_width/2 : beam_width : 7*beam_width]) {
            translate([x,beam_width/2,-2])
            cylinder(r=hole_radius, h=12, $fn=30);
        }
    }
}


difference() {
    box();
    
    translate([(7*beam_width-J)/2,(5*beam_width-A)/2])
    servo();
}
