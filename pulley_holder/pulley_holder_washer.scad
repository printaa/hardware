$fn = 32;

// options
middle = false;

// constants
inner = 5.75;
outer = 9;
height = middle ? 6 : 3.5;

difference() {
  cylinder(d=outer, h=height, center=true);
  cylinder(d=inner, h=height, center=true);
}