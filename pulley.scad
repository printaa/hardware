/* [Hidden] */
$fn = 128;


/* [Ball Bearing] */
//better add 0.5 mm to make it fit easily
bearing_diameter = 14.35;
bearing_height = 5;
bearing_holder_diameter = 12;

/* [Pulley] */
pulley_height = 10;
pulley_diameter = 20.5+0.5;
pulley_guide_width = 0.75;
tooth = true;

module GT2_tooth(h) {
  translate([-1,-0.5,0]) cube([2,0.5,h]);
  linear_extrude(height=h) polygon([[0.747183,-0.5],[0.747183,0],[0.647876,0.037218],[0.598311,0.130528],[0.578556,0.238423],[0.547158,0.343077],[0.504649,0.443762],[0.451556,0.53975],[0.358229,0.636924],[0.2484,0.707276],[0.127259,0.750044],[0,0.76447],[-0.127259,0.750044],[-0.2484,0.707276],[-0.358229,0.636924],[-0.451556,0.53975],[-0.504797,0.443762],[-0.547291,0.343077],[-0.578605,0.238423],[-0.598311,0.130528],[-0.648009,0.037218],[-0.747183,0],[-0.747183,-0.5]]);
}

difference() {
  union() {
    translate([0,0,pulley_height/2-pulley_guide_width/2])
    cylinder(r = pulley_diameter/2+1, h = pulley_guide_width, center=true);
    translate([0,0,-pulley_height/2+pulley_guide_width/2])
    cylinder(r = pulley_diameter/2+1, h = pulley_guide_width, center=true);
    cylinder(r = pulley_diameter/2, h = pulley_height, center=true);
  }
  if(tooth) {
    for(i=[1:33]) 
    rotate([0,0,i*(360/33)])
    translate([0,-10.25,-(pulley_height-pulley_guide_width*2)/2]) 
    GT2_tooth(pulley_height-pulley_guide_width*2);
  }
  // ball bearing
  translate([0,0,0.05]) {
    cylinder(h=bearing_height+0.1, r=bearing_diameter/2, center=true);
  }
  
  hole_thickness = (pulley_height-bearing_height)/2+0.04;
  
  // upper hole
  translate([0,0,bearing_height/2]) {
    cylinder(h=hole_thickness, r1=bearing_diameter/2-0.1, r2=bearing_diameter/2);
  }
  
  // lower hole
  translate([0,0,-pulley_height/2-0.02]) {
    cylinder(h=hole_thickness, r=bearing_holder_diameter/2);
  }
}