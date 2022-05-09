use <mymodules.scad>

width = 70;
length = 80;
height = 30;

thickness = 2; // thickness
roundness = 2; // roundness

// mounting hole parameters
mountheight = 8;
mountwidth = 6;
mountholewidth = 2;
mountholeheight = 6;

// circuit parameters
preview = true; // set to false if printing this
lidmode = 0; // true if you want the lid, false if you want the box
c_width = 46;
c_length = 25;
c_holewidth = 3;
c_holemargin = 1.5;


module boxlid(width, length, thickness, mountwidth, mountholewidth)
{   
    // we need to make the lid a bit smallor, or it usually won't fit
    tolerance = 1;
    size = [width - tolerance, length - tolerance, thickness];
    w_offset = (width - mountwidth) / 2;
    l_offset = (length - mountwidth) / 2;
    difference() {
        cube(size, center = true);
        translate([+w_offset, +l_offset, 0]) 
            cylinder(thickness + tolerance, mountholewidth / 2 + tolerance, center = true);
        translate([+w_offset, -l_offset, 0]) 
            cylinder(thickness + 2, mountholewidth / 2 + 1, center = true);
        translate([-w_offset, -l_offset, 0]) 
            cylinder(thickness + 2, mountholewidth / 2 + 1, center = true);
        translate([-w_offset, +l_offset, 0]) 
            cylinder(thickness + 2, mountholewidth / 2 + 1, center = true);
    }
}

if (!lidmode) {
    circuitbox(width, length, height, thickness, roundness,
                    mountwidth, mountheight, mountholewidth, mountholeheight);
}
else {
    boxlid(width, length, thickness, mountwidth, mountholewidth);
}


module circuit(width, height, position)
{
    
}
if (preview) {
    circuit();
}
