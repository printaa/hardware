$fn=32;

difference() {
  scale([1,1,0.5]) translate([0,0,-1]) rotate([90,0,0]) cylinder(r=15+1, h=19.5+2, center=true);
  scale([1,1,0.5]) rotate([90,0,0]) cylinder(r=15, h=19.5, center=true);
  translate([0,0,50/2]) cube([50,50,50], center=true);
  translate([50/2,0,0]) cube([50,50,50], center=true);
}
difference() {
  translate([30/2,0,-15/2/2]) cube([30,19.5+2,15/2+2], center=true);
  translate([30/2,0,-15/2/2]) cube([30,19.5,15/2], center=true);
  
  translate([19,0,10]) rotate([0,20,0]) union() {
    cube([30,19.5+2,20], center=true);
    translate([30/2+5/2,0,-10]) cube([5,19.5+2,20], center=true);
  }
}
difference() {
  translate([19,0,-1/2]) rotate([0,20,0]) cube([23,19.5+2,1], center=true);
  translate([19,0,10]) rotate([0,20,0]) translate([30/2+5/2,0,-10]) cube([5,19.5+2,20], center=true);
  translate([0,0,50/2+1]) cube([50,50,50], center=true);
}
difference() {
  translate([-15/2,0,1/2]) cube([15+2,19.5+2,1], center=true);
  translate([-15/2,0,1/2]) cube([15,19.5,1], center=true);
}