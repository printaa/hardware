$fn=128;

difference() {
  union() {
    cylinder(d=10, h=3.5);
    translate([0,0,3.5]) cylinder(d=16, h=11);
    translate([0,0,3.5+11]) hull() {
      cylinder(d=20, h=1.5);
      translate([22,0,0]) cylinder(d=20, h=1.5);
    }
    translate([22,0,3.5+11-3.5]) cylinder(d=10, h=3.5);
  }
  cylinder(d=5+0.5,h=100, center=true);
  translate([22,0,0])cylinder(d=5+0.5,h=100, center=true);
}