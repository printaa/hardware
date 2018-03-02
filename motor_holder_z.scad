use <./library.scad>;

$fn = 32;

w=42.3;
difference() {
  translate([w/2-20, 0, 0]) cube([w,w,5], center=true);
  translate([w/2-20, 0, 2.51]) rotate([180,0,0]) nema17(height=60, screw_mask_height=10, screw_mask_slot_length=2, center_mask_height=10);
}

translate([0,w/2,0]) mount();
translate([0,-w/2,0]) scale([1,-1,1]) mount();

module mount () {
  translate([10,0,-2.5]) cube([w-30,3,5]);
  difference() {
    translate([0,-2,-15]) cube([10,22,15+2.5]);
    translate([5,10,-(15-2.5)/2]) rotate([0, -90, 0]) screw(d=5, l=20);
  }
  translate([0,3,0]) rotate([90,0,0]) linear_extrude(height=5) polygon(points=[[10, -2.5], [10, -15], [w/2+1.1, -2.5]]);
  rotate([90,0,0]) linear_extrude(height = 2) polygon(points = [[0, -2.5], [0, -15], [-w/2+1.1, -2.5]]);
}