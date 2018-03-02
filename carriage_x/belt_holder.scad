$fn=32;
use <../library.scad>;

difference() {
  difference() {
    translate([0,0,0]) cube([5,20,10], center=true);
    translate([0, 5,0]) rotate([0,90,0]) screw(d=3, l=3);
    translate([0,-5,0]) rotate([0,90,0]) screw(d=3, l=3);
  }
  for(i = [-3:3]) translate([i*2,0,-(6+1)/2]) GT2_tooth(h=6+1+2);
}