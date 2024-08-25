//
// ktRACK39
//
 
gap1 = 0.001;
gap2 = 0.002;
th = 2;

W = 118;
D = 9.7;
H = 181;

BW = 66;
BD = 100;
BH = 4;
TW = 41;
TD = 76.5;
TH = 4;
HH = 74;



dai();
ura3();



module dai()
{
difference()
{
    union()
    {
        translate([0, 0, 15]) rotate([-25, 0, 0]) base();
        translate([-W/2, 0, 0]) cube([W, 80, 4]);
        translate([-36, 85, 0]) resize([66+th*2, 100+th*2, 4]) cylinder($fn=100);
        translate([ 36, 85, 0]) resize([66+th*2, 100+th*2, 4]) cylinder($fn=100);
        ura();
    }
    translate([-36, 85, th]) sp_unit();
    translate([ 36, 85, th]) sp_unit();
    
    translate([0, 0, 0]) ura2();
    translate([-4/2, 80-8, 25]) cube([4, 10, 80]);

    translate([-500/2, -500/2, -100]) cube([500, 500, 100]);
}
}
module ura()
{
difference()
{
    union()
    {
        translate([-W/2, 0, th]) cube([W, 80, 75]);
    }
    translate([-W/2-gap1, -50, 0]) rotate([-25, 0, 0]) cube([W+gap2, 50, 200]);
    translate([-36-1, 85, th]) scale([1.1, 1.05, 1.05]) sp_unit();
    translate([ 36+1, 85, th]) scale([1.1, 1.05, 1.05]) sp_unit();
    translate([-W/2-5, 50-5, 0]) rotate([25, -20, 180]) cube([W, 50, 200]);
    translate([ W/2+5, -5, 0]) rotate([-25, -20, 0]) cube([W, 50, 200]);
}
}
module ura2()
{
difference()
{
    union()
    {
        translate([-(W-th*2)/2, 0, th]) cube([W-th*2, 80-th, 75]);
    }
    translate([-W/2-gap1, -50+th, 0]) rotate([-25, 0, 0]) cube([W+gap2, 50, 200]);
    translate([-36-1, 85, th]) scale([1.1+0.05, 1.05+0.05, 1.05]) sp_unit();
    translate([ 36+1, 85, th]) scale([1.1+0.05, 1.05+0.05, 1.05]) sp_unit();
    translate([-W/2-5+th, 50-5, 0]) rotate([25, -20, 180]) cube([W, 50, 200]);
    translate([ W/2+5-th, -5, 0]) rotate([-25, -20, 0]) cube([W, 50, 200]);
}
}
module ura3()
{
translate([0, 0, th])
difference()
{
    union()
    {
        translate([-W/2, 0, th]) cube([W, 80, 75]);
    }
    translate([-W/2-gap1, -50, 0-th]) rotate([-25, 0, 0]) cube([W+gap2, 50, 200]);
    translate([-36-1, 85, th]) scale([1.1, 1.05, 1.05]) sp_unit();
    translate([ 36+1, 85, th]) scale([1.1, 1.05, 1.05]) sp_unit();
    translate([-W/2-5, 50-5, 0]) rotate([25, -20, 180]) cube([W, 50, 200]);
    translate([ W/2+5, -5, 0]) rotate([-25, -20, 0]) cube([W, 50, 200]);
    
    translate([0, 60, 75+th-5+1]) cube([40, 5, 5]);

    translate([-500/2, -500/2, -100+75]) cube([500, 500, 100]);
}
translate([-40/2, 44, 75+th-5]) cube([40, 5, 5]);
translate([-20/2, 80-5-2.5, 75+th-5]) cube([20, 5, 5]);
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

module sp_unit()
{
    hull()
    {
        translate([0, 0, HH-TH]) resize([TW, TD, TH]) cylinder($fn=100);
        translate([0, 0, 0]) resize([BW, BD, BH]) cylinder($fn=100);
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
