//
// ktRACK39
//
 
gap1 = 0.001;
gap2 = 0.002;
th = 2;

W = 118;
D = 9.7;
H = 181;


dai();
futa();

module dai()
{
difference()
{
    union()
    {
        translate([0, 0, 15]) rotate([-30, 0, 0]) base();
        
        translate([-W/2+10, 0, 0]) rotate([0, 0, 0])  cube([10, 70, 13]);
        translate([-W/2+10, 65, 0]) rotate([0, 0, 0]) cube([10, 15,120]);
        translate([W/2-10-10, 0, 0]) rotate([0, 0, 0]) cube([10, 70, 13]);
        translate([W/2-30-10, 65, 0]) rotate([0, 0, 0]) cube([30, 15, 120]);
    }
    translate([0, 0, 15]) rotate([-30, 0, 0]) unit();
    
    translate([W/2-30+12.5-10, 65-gap1, th]) rotate([0, 0, 0]) cube([5, 15-th, 120]);
    translate([W/2-30+th-10, 65+10-th, th]) rotate([0, 0, 0]) cube([30-th*2, 5, 120]);

    translate([-500/2, -500/2, -100]) cube([500, 500, 100]);
}
}


module futa()
{
difference()
{
    union()
    {
        futa_waku();
    }
    translate([0, th, -gap1]) scale([0.95, 0.95, 0.95]) futa_waku();
    
    translate([W/2-30+12.5-10, 65-gap1-10, 0]) rotate([0, 0, 0]) cube([5, 15-th, 30-th]);
    
    translate([W/2-30+12.5-10-19.5, 65-gap1+10, 0]) rotate([0, 0, 0]) cube([5, 15-th, 10]);
    translate([-W/2+10+10+2, 65-gap1+10, 0]) rotate([0, 0, 0]) cube([5, 15-th, 10]);
    translate([-12, 65-gap1+10, 0]) rotate([0, 0, 0]) cube([5, 15-th, 10]);
}
}
module futa_waku()
{
difference()
{
    union()
    {
        translate([-(W-10*2-10*2-1)/2, 10, 0]) cube([W-10*2-10*2-1, 70, 30]);
    }
    translate([-W/2, -(D+th*2), D/2-25+15]) rotate([-30, 0, 0]) cube([W, D+th*2, H]);
    translate([W/2-30-10-0.5, 65-0.5, 0]) rotate([0, 0, 0]) cube([30, 15+1, 120]);
}
}

 
module base()
{
difference()
{
    union()
    {
        translate([-W/2, -th, D/2-25]) cube([W, D+th*2, 25]);
    }
   
    unit();
}
}
 
module unit()
{
    translate([-(W-D)/2, 0, D/2]) cube([W-D, D, H-D]);
    
    translate([-W/2+D/2, D/2, D]) rotate([0, 0, 0]) cylinder(r=D/2, h=H-D*2, $fn=100);
    translate([-W/2+D, D/2, H-D]) rotate([90, -90, 0]) rotate_extrude(angle=90, convexity=10, $fn=100) translate([D/2, 0, 0]) circle(r=D/2, $fn=100);
    
    translate([-W/2+D, D/2, H-D/2]) rotate([0, 90, 0]) cylinder(r=D/2, h=W-D*2, $fn=100);
    translate([ W/2-D, D/2, H-D]) rotate([90, 0, 0]) rotate_extrude(angle=90, convexity=10, $fn=100) translate([D/2, 0, 0]) circle(r=D/2, $fn=100);

    translate([ W/2-D/2, D/2, D]) rotate([0, 0, 0]) cylinder(r=D/2, h=H-D*2, $fn=100);
    translate([ W/2-D, D/2, D]) rotate([90, 90, 0]) rotate_extrude(angle=90, convexity=10, $fn=100) translate([D/2, 0, 0]) circle(r=D/2, $fn=100);

    translate([-W/2+D, D/2, D/2]) rotate([0, 90, 0]) cylinder(r=D/2, h=W-D*2, $fn=100);
    translate([-W/2+D, D/2, D]) rotate([90, 180, 0]) rotate_extrude(angle=90, convexity=10, $fn=100) translate([D/2, 0, 0]) circle(r=D/2, $fn=100);
}
