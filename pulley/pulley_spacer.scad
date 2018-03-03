$fn=128;

mode = "spacer"; // spacer (for x-carriage) or washer_outer/washer_middle (for pulley holder)

total_height = 30;
bearing_height = 5;
pulley_height = 12;
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