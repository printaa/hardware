$fn = 32;

module nema17(height, screw_mask_height) {
    difference() {
        translate([0,0,-height/2]) {
            hull() {
                cube([42.3, 31, height], center=true);
                cube([31, 42.3, height], center=true);
            }
        }
        translate([31/2,31/2,-4.5]) cylinder(h=9,d=3);
        translate([31/2,-31/2,-4.5]) cylinder(h=9,d=3);
        translate([-31/2,31/2,-4.5]) cylinder(h=9,d=3);
        translate([-31/2,-31/2,-4.5]) cylinder(h=9,d=3);
    }
    cylinder(h=2+0.5, d=22+1);
    cylinder(h=27, d=5+2);
    
    if(screw_mask_height>0) {
        translate([31/2,31/2,0]) cylinder(h=screw_mask_height,d=3);
        translate([31/2,-31/2,0]) cylinder(h=screw_mask_height,d=3);
        translate([-31/2,31/2,0]) cylinder(h=screw_mask_height,d=3);
        translate([-31/2,-31/2,0]) cylinder(h=screw_mask_height,d=3);
    }
}

w=42.3;
difference() {
    cube([w,w+5,5]);
    translate([w/2, w/2, -0.05]) nema17(height=60, screw_mask_height=10);
}

difference() {
  translate([-10, 20+5/2, 1]) cube([20,5,42],center=true);
  translate([-10,30,-12.5]) rotate([90,0,0]) cylinder(d=5.5, h=20);
  translate([-10,30,12.5]) rotate([90,0,0]) cylinder(d=5.5, h=20);
}

translate([-5/2, 3*w/4+2.5, 1]) cube([5,w/2+5,42],center=true);

difference() {
  union() {
    difference() {
      translate([5/2, w/2+2.5, 11]) cube([5,w+5,22],center=true);
      translate([-10,10,12.5]) rotate([90,0,90]) cylinder(d=5.5, h=20);
    }

    translate([5,5,5])
    rotate([90,0,0])
    linear_extrude(height = 5)
    polygon(points = [[0, 0], [0, 17], [w-5, 0]]);

    translate([0,w+5,0])
    rotate([90,0,0])
    linear_extrude(height = 5)
    polygon(points = [[0, 0], [0, -20], [w, 0]]);
  }
  translate([w/2+31/2,w/2+31/2,0]) cylinder(h=14,d=6);
  translate([w/2+31/2,w/2-31/2,0]) cylinder(h=14,d=6);
  translate([w/2-31/2,w/2+31/2,0]) cylinder(h=14,d=6);
  translate([w/2-31/2,w/2-31/2,0]) cylinder(h=14,d=6);
  
  translate([w/2+31/2,w/2+31/2,0]) cylinder(h=100,d=3);
  translate([w/2+31/2,w/2-31/2,0]) cylinder(h=100,d=3);
  translate([w/2-31/2,w/2+31/2,0]) cylinder(h=100,d=3);
  translate([w/2-31/2,w/2-31/2,0]) cylinder(h=100,d=3);
}