use <mymodules.scad>


translate([0, 0, 0])   support4(31, 37, 3, 3, 5, 5, 2);
translate([33, 10, 0]) support2_4(10, 26, 3, 3, 5, 5, 2);
translate([45, 0, 0])  support2_2(26, 58, 3, 3, 5, 5, 2);
translate([73, 5, 0])  support4(21, 44, 3, 6, 5, 5, 2);
cube([94, 50, 1]);
