use <mymodules.scad>

width = 110;
length = 110;
height = 110;
roundness = 5;
lidmode = true;

if (lidmode) {
    basebox(110, 110, 110, 2, 5);
}
else {

//    translate([0, 0, 100 - 5]) rotate([180, 0, 0])basebox(103, 103, 100, 2, 5);
}