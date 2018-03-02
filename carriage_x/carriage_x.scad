$fn=32;
use <../library.scad>;

use_insert_nuts = true;

difference() {
  union() {
    // main cube
    translate([0,0,-10/2]) cube([60,75,10], center=true);
  }
    
  // shafts + linear bearings
  _bearing_x_offset = (24+1)/2+2.5;
  e3d_fan_width=30+3;
  zip_tie_width=4;
  zip_tie_thickness=1.5;
  _zip_tie_x_offset = e3d_fan_width/2+zip_tie_width/2;
  translate([ _bearing_x_offset,-25,0]) rotate([0,90,0]) lm8uu();
  translate([ _zip_tie_x_offset,-25,0]) rotate([0,90,0]) lm8uu_zip_tie(width=zip_tie_width, thickness=zip_tie_thickness);
  translate([-_bearing_x_offset,-25,0]) rotate([0,90,0]) lm8uu();
  translate([-_zip_tie_x_offset,-25,0]) rotate([0,90,0]) lm8uu_zip_tie(width=zip_tie_width, thickness=zip_tie_thickness);
  translate([0,25,0]) rotate([0,90,0]) lm8uu();
  translate([0,25,0]) rotate([0,90,0]) lm8uu_zip_tie(width=zip_tie_width, thickness=zip_tie_thickness);
  
  translate([ 12.5, 12.5, -5]) rotate([0,0,0]) screw(d=5, l=40);
  translate([ 12.5,-12.5, -5]) rotate([0,0,0]) screw(d=5, l=40);
  translate([-12.5, 12.5, -5]) rotate([0,0,0]) screw(d=5, l=40);
  translate([-12.5,-12.5, -5]) rotate([0,0,0]) screw(d=5, l=40);

  translate([ 60/2-5, 0,-5]) belt_holders_slot();
  translate([-60/2+5, 0,-5]) rotate([0,180,0]) belt_holders_slot();
}

module belt_holders_slot () {
  cube([10,21,10], center=true);
  translate([-5, 5.5,0]) union() {
    rotate([0,0,-90]) m3_mounting_hole(use_insert_nuts);
    rotate([0,-90,0]) screw(d=3, l=20, head=false);
  }
  translate([-5,-5.5,0]) union() {
    rotate([0,0,-90]) m3_mounting_hole(use_insert_nuts);
    rotate([0,-90,0]) screw(d=3, l=20, head=false);
  }
}
