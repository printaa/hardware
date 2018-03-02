$fn=32;
use <../library.scad>;

nema17_width = 42.3;
GT2_pulley_diameter = 12.73;
ALU_width = 20;
GT2_thickness = 2;
crowned_pulley_diameter = 20;

screw_x = nema17_width/2 + GT2_pulley_diameter/2 - ALU_width + GT2_thickness + crowned_pulley_diameter/2;
size_x = screw_x + 5;
screw_y = ALU_width - 5;

difference() {
  union() {
    translate([size_x/2,0,0]) cube([size_x,ALU_width,41], center=true);
    translate([5/2,0,0]) cube([5,20,65], center=true);
  }
  translate([100/2+5,0,0]) cube([100,100,2*10+3], center=true);
  translate([screw_x,screw_y-ALU_width/2,41/2-5]) rotate([180,0,0]) screw(d=5, l=41);
  translate([screw_x,screw_y-ALU_width/2,-41/2]) cylinder(h=5, d=9.24+0.1, $fn=6); // nut

  translate([10,0, (65+41)/4]) rotate([0,-90,0]) screw(d=5, l=10, head=false);
  translate([10,0,-(65+41)/4]) rotate([0,-90,0]) screw(d=5, l=10, head=false);
}