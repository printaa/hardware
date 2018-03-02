$fn = 32;
use <./library.scad>; 

difference() {
  translate([0,0,5]) cube([32,14,10], center=true);
  translate([0,0,2.5]) cylinder(d=8+0.25, h=100);
  translate([9.5,0,5]) rotate([0,180,0]) screw(d=5, l=5.1);
  translate([-9.5,0,5]) rotate([0,180,0]) screw(d=5, l=5.1);
}