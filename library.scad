module lm8uu (shaft_length=100) {
  d = 15.5;
  l = 24+1;
  cylinder(d=8+4, h=shaft_length, center=true);
  cylinder(d=d, h=l, center=true);
}

module lm8uu_zip_tie (thickness, width) {
  d = 15.5;
  cylinder(d=15.5+thickness*2, h=width, center=true);
  translate([0,0+(d+thickness)/2,0]) cube([100,thickness,width], center=true);
  translate([0,0-(d+thickness)/2,0]) cube([100,thickness,width], center=true);
}

module m3_mounting_hole(use_insert_nuts=false) {
  if (!use_insert_nuts) {
    translate([0, 0, 0]) rotate([90,0,0]) cylinder(d=3+0.5, h=8);
    slot_width = 5.5+0.6;
    slot_depth = 2.4+0.6;
    translate([0, -2-(slot_depth)/2, 0]) cube([slot_width,slot_depth,100], center=true);
  } else {
    translate([0, 0 + 2.5 - 5, 0]) rotate([90,0,0]) cylinder(d=4, h=5, center=true);
  }
}

function screw_head_diameter(screw_diameter) = lookup(screw_diameter, [
   [1.4, 2.6],
   [1.6, 3],
   [2.0, 3.8],
   [2.5, 4.5],
   [3.0, 5.5],
   [4.0, 7],
   [5.0, 8.5],
   [6.0, 10],
   [8.0, 13],
   [ 10, 16],
   [ 12, 18],
   [ 14, 21],
   [ 16, 24],
   [ 18, 27],
   [ 20, 30]
 ]);

// scale allows for better fit of screw in hole
// seperation avoids overhands when printing screw hole with head at bottom
module screw (d, l, head=true, scale=1.1, separation=0) { 
  half_scale = (1+(scale-1)/2);
  cylinder(h=l, d=d*scale, center=false);
  if (head) {translate([0,0,-d*half_scale]) cylinder(
    d=screw_head_diameter(d)*scale,
    h=d*scale-separation
  );}
}

module GT2_tooth(h) {
  extra_width = 0.5;
  translate([-1,-0.5-extra_width,0]) cube([2,0.5+extra_width,h]);
  linear_extrude(height=h) polygon([[0.747183,-0.5],[0.747183,0],[0.647876,0.037218],[0.598311,0.130528],[0.578556,0.238423],[0.547158,0.343077],[0.504649,0.443762],[0.451556,0.53975],[0.358229,0.636924],[0.2484,0.707276],[0.127259,0.750044],[0,0.76447],[-0.127259,0.750044],[-0.2484,0.707276],[-0.358229,0.636924],[-0.451556,0.53975],[-0.504797,0.443762],[-0.547291,0.343077],[-0.578605,0.238423],[-0.598311,0.130528],[-0.648009,0.037218],[-0.747183,0],[-0.747183,-0.5]]);
}

module stepper_motor(
  height=40,
  width=43.18,
  chamfer=4,
  screw_distance=31,
  pilot_diameter=22,
  pilot_height=2.5,
  screw_mask_height=0,
  screw_mask_slot_length=0
) {
  difference() {
    translate([0,0,-height/2]) hull() {
      cube([width, width-chamfer*2, height], center=true);
      cube([width-chamfer*2, width, height], center=true);
    }
    translate([screw_distance/2,screw_distance/2,-4.5]) cylinder(h=9,d=3);
    translate([screw_distance/2,-screw_distance/2,-4.5]) cylinder(h=9,d=3);
    translate([-screw_distance/2,screw_distance/2,-4.5]) cylinder(h=9,d=3);
    translate([-screw_distance/2,-screw_distance/2,-4.5]) cylinder(h=9,d=3);
  }
  cylinder(h=pilot_height, d=pilot_diameter);
  cylinder(h=27, d=5+2);
    
  screw_slot( screw_distance/2, screw_distance/2);
  screw_slot( screw_distance/2,-screw_distance/2);
  screw_slot(-screw_distance/2, screw_distance/2);
  screw_slot(-screw_distance/2,-screw_distance/2);
  
  module screw_slot(x, y) { hull() {
    dx = x > 0 ? screw_mask_slot_length/2 : -screw_mask_slot_length/2;
    dy = y > 0 ? screw_mask_slot_length/2 : -screw_mask_slot_length/2;
    translate([x+dx,y+dy,screw_mask_height]) rotate([180,0,0]) screw(d=3, l=screw_mask_height, d=3, head=false);
    translate([x-dx,y-dy,screw_mask_height]) rotate([180,0,0]) screw(d=3, l=screw_mask_height, d=3, head=false);
  }}
}