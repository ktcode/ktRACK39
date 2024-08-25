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


module dai()
{
difference()
{
    union()
    {
        translate([0, 0, 15]) rotate([-25, 0, 0]) base();
        translate([-10/2, 0, 0]) cube([10, 56, 10]);
        
        translate([-10/2, 50, -10]) rotate([10, 0, 0]) cube([10, 10, 88]);
    }
    #translate([-36, 85, th]) sp_unit();
    #translate([ 36, 85, th]) sp_unit();
    
    #translate([-W/2, 4, 15+10]) rotate([-25, 0, 0]) cube([W, 10, 100]);
    
    translate([0, -15, 0]) sw_unit();


    translate([-500/2, -500/2, -100]) cube([500, 500, 100]);
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


module sw_unit()
{
    translate([-47/2, -18/2, 0]) cube([47, 18, 13]);
    translate([0, 0, 13]) cylinder(r=14/2, h=10, $fn=100);

    difference()
    {
        translate([0, 60/2-5, 0]) resize([100, 60, 13/2+5/2]) cylinder($fn=100);
        translate([0, 60/2-5, -gap1]) resize([100-5*2, 60-5*2, 13/2+5/2+gap2]) cylinder($fn=100);
        translate([-W/2, 60/2-5, -gap1]) cube([W, 50, 20]);
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
