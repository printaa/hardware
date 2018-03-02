$fn=128;

total_height = 30;
bearing_height = 5;

h_plane = 1.5;
h_washer = 3.5;
h_pillar = total_height - 2*h_plane - 2*h_washer - bearing_height;

difference() {
  union() {
    cylinder(d=10, h=h_washer);
    translate([0,0,h_washer]) cylinder(d=16, h=h_pillar);
    translate([0,0,h_washer+h_pillar]) hull() {
      cylinder(d=20, h=h_plane);
      translate([22,0,0]) cylinder(d=20, h=h_plane);
    }
    translate([22,0,h_pillar]) cylinder(d=10, h=h_washer);
  }
  cylinder(d=5+0.5,h=total_height);
  translate([22,0,0])cylinder(d=5+0.5,h=total_height);
}