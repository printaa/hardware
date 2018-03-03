$fn=32;
use <./library.scad>;

// options
with_linear_bearings = true;
use_insert_nuts=true;
layer_height=0.2; // required to force printed layer between screw head and thread (screw_separation)

// constants
nema17_width = 42.3;
GT2_pulley_diameter = 12.73;
GT2_thickness = 2;
pulley_diameter = 20;
screw_x = nema17_width/2 + GT2_pulley_diameter/2 + GT2_thickness + pulley_diameter/2;
screw_separation=with_linear_bearings ? 2*layer_height : 0;

difference() {
  if(with_linear_bearings) union() {
    translate([20/2,0,-10/2]) cube([20,65,10], center=true);
    translate([50/2,0,-10/2]) cube([50,40,10], center=true);
  } else {
    translate([30/2+20,0,0]) cube([30,40,20], center=true);
  }
  //y-axis shaft + bearings
  _bearing_y_offset = 25/2+2.5;
  translate([10, _bearing_y_offset,0]) rotate([90,90,0]) lm8uu();
  translate([10, _bearing_y_offset,0]) rotate([90,90,0]) lm8uu_zip_tie(width=4, thickness=1.5);
  translate([10,-_bearing_y_offset,0]) rotate([90,90,0]) lm8uu();
  translate([10,-_bearing_y_offset,0]) rotate([90,90,0]) lm8uu_zip_tie(width=4, thickness=1.5);
  
  //x-axis shafts
  translate([22.5,0,0]) rotate([0,90,0]) cylinder(d=8+0.25, h=40);
  
  //pulley holding screws
  translate([screw_x, 11,-10+5]) screw(d=5, l=40, separation=screw_separation);;
  translate([screw_x,-11,-10+5]) screw(d=5, l=40, separation=screw_separation);
  //additional screws
  if(with_linear_bearings) {
    translate([25, 11,-10+5]) screw(d=5, l=40, separation=screw_separation);
    translate([25,-11,-10+5]) screw(d=5, l=40, separation=screw_separation);
  }
  
  // ### side mounting holes ###
  translate([33,32.5,-5]) m3_mounting_hole(use_insert_nuts);
  translate([33,-32.5,-5]) rotate([0,0,180]) m3_mounting_hole(use_insert_nuts);
}