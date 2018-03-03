$fn=128;

// render spacer or washer for pulley holder
mode = "spacer"; // [spacer:spacer for y carriage, washer_outer:outer washer for pulley holder, washer_middle:middle washer for pulley holder]
// height of the linear bearing
bearing_height = 5;
// height of the pulley
pulley_height = 12;
// space between upper and lower x carriage
total_height = 30;
// height of the spacer plane
h_plane = 1.5;

inner_height = total_height - 2*h_plane;
space_between_pulleys = (inner_height-2*pulley_height)/3;
h_washer = (pulley_height-bearing_height)/2 + space_between_pulleys;
h_washer_middle = pulley_height-bearing_height + space_between_pulleys;
h_pillar = pulley_height + space_between_pulleys;

difference() {
  cylinder(d=10, h=mode == "washer_middle" ? h_washer_middle : h_washer);
  cylinder(d=5+0.5,h=total_height);
} 
if (mode == "spacer") {
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
}