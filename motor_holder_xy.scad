use <./library.scad>;

$fn = 32;
stepper_width=42.3;

difference() {
  translate([stepper_width/2-20, 0, 0]) cube([stepper_width,stepper_width,5], center=true);
  translate([stepper_width/2-20, 0, -2.5]) rotate([0,0,0]) stepper_motor(
    height=60,
    width=stepper_width,
    chamfer=4,
    screw_distance=31,
    pilot_diameter=22+2,
    pilot_height=10,
    screw_mask_height=10,
    screw_mask_slot_length=2
  );
}

translate([0,stepper_width/2,0]) mount();

module mount () {
  translate([10,0,-2.5]) cube([stepper_width-30,3,5]);
  translate([0,-2,0]) cube([10,2,15]);
  difference() {
    translate([0,0,-15]) cube([10,20,30]);
    translate([5,10,-15/2]) rotate([0, -90, 0]) screw(d=5, l=20);
    translate([5,10,15/2]) rotate([0, -90, 0]) screw(d=5, l=20);
  }
  translate([0,3,0]) rotate([90,0,0]) linear_extrude(height=5) polygon(points=[
    [10, 2.5],
    [10, 15],
    [stepper_width-20, 2.5]
  ]);
  translate([0,3,0]) rotate([90,0,0]) linear_extrude(height=3) polygon(points=[
    [10, -2.5],
    [10, -15],
    [stepper_width-20, -2.5]
  ]);
  rotate([90,0,0]) linear_extrude(height = 2) polygon(points = [
    [0, 2.5],
    [0, 15],
    [-20, 2.5]
  ]);
}