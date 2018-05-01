$fn=32;
use <../library.scad>;
use_insert_nuts = true;
layer_height=0.2;

difference() {
  union() {
    // main cube
    translate([0,0,0]) cube([60,75,20], center=true);
  }
  translate([0,0,10]) cube([60.1,75.1,20], center=true);
    
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
  
  translate([ 12.5, 12.5, 5]) rotate([180,0,0]) screw(d=5, l=40, separation=layer_height*2);
  translate([ 12.5,-12.5, 5]) rotate([180,0,0]) screw(d=5, l=40, separation=layer_height*2);
  translate([-12.5, 12.5, 5]) rotate([180,0,0]) screw(d=5, l=40, separation=layer_height*2);
  translate([-12.5,-12.5, 5]) rotate([180,0,0]) screw(d=5, l=40, separation=layer_height*2);

  belt_slots();
  
  blower_fan_mounting_holes();
}

module blower_fan_mounting_holes () {
  translate([25, 39,0]) union() {
    //#translate([0,0,25]) rotate([0,0,180]) import("5015_blower_fan_thingiverse-1576438.stl");
    translate([-4.25,-44.75,10.1]) rotate([90,0,0]) m3_mounting_hole(use_insert_nuts);
    translate([-46.88,-7.08,10.1]) rotate([90,0,0]) m3_mounting_hole(use_insert_nuts);
  }
}

module belt_slots () {
  distance=13.015;
  translate([0,distance/2,0]) cube([100,7,2.5], center=true);
  translate([0,-distance/2,0]) cube([100,7,2.5], center=true);
  
  module side_slot (w) {
    translate([0,0,-10/2]) cube([w,7,10], center=true);
    difference() {
      r=5;
      translate([0,0,-r]) cube([w+2*r,7,r*2], center=true);
      translate([-w/2-r,0,-r]) rotate([90,0,0]) cylinder(r=r, h=7, center=true);
      translate([w/2+r,0,-r]) rotate([90,0,0]) cylinder(r=r, h=7, center=true);
    }
  }
  
  translate([-60/2+10, distance/2,-2.5/2]) side_slot(3.25);
  translate([-60/2+10,-distance/2,-2.5/2]) side_slot(3.25);
  
}
