use <roundedcube.scad>

module lidsupportline(width, height, thickness, depth)
{
    centroid = [-depth/2, 0, 0];
    translate(centroid) rotate([90, 0, 0]) rotate([0, 90, 0])
        linear_extrude(height=depth) rotate([180, 0, 0])
    {
        polygon(points=[[0,0],[width,0],[width, 1],[thickness, height + 1], [0, thickness + 1]]);
    }
}

module lidsupport(width, height, thickness, x, y)
{

    translate([0, -y/2, 0])rotate([0, 0, 0])
        lidsupportline(width, height, thickness, x);
    translate([0, y/2, 0])rotate([0, 0, 180])
        lidsupportline(width, height, thickness, x);

    translate([x/2, 0, 0])rotate([0, 0, 90])
        lidsupportline(width, height, thickness, y);

    translate([-x/2, 0, 0])rotate([0, 0, -90])
        lidsupportline(width, height, thickness, y);
}

module boxhole(width, height, holewidth, holeheight)
{
   size = [width, width, height];
   size2 = [width * 2, width * 2, height/2];
 
   difference() {
       roundedcube(size, true, 1, "z");
       rotate([-45, 0, 0])translate([0, 0, -height/2])cube(size2, true);
       translate([0, 0, (height - holeheight) / 2]) 
            cylinder(h = holeheight + 1, r = holewidth/2, center = true);
   }
}

module emptybox(width, length, height, thickness, roundness) 
{
    center = true;
    apply_to = "all";
    offset = thickness * 2;
    
    sizeouter = [width + offset, length + offset, height + offset];
    // increase the height, so that it actually chops the top
    sizeinner = [width, length, height + offset];
    union() {
        // the box itself
        difference() {
            roundedcube(sizeouter, center, roundness, apply_to);
            translate([0, 0, thickness])cube(sizeinner,  center);
        };
        translate([0, 0, height / 2])
            lidsupport(thickness + 1, thickness, thickness,
                width + thickness * 2 - 1, length + thickness * 2 - 1);
    }
}


module circuitbox(width, length, height, thickness, roundness,
                mountwidth, mountheight, mountholewidth, mountholeheight)
{
    w_offset = (width - mountwidth) / 2;
    l_offset = (length - mountwidth) / 2;
    h_offset = (height - mountheight) / 2;

    union() {
        // Draw box
        emptybox(width, length, height, thickness, roundness);
        // mount holes
        translate([ +w_offset, +l_offset, h_offset]) 
                boxhole(mountwidth, mountheight, mountholewidth, mountholeheight);
        translate([ +w_offset, -l_offset, h_offset]) rotate([0, 0, 180])
                boxhole(mountwidth, mountheight, mountholewidth, mountholeheight);
        translate([ -w_offset, -l_offset, h_offset]) rotate([0, 0, 180])
                boxhole(mountwidth, mountheight, mountholewidth, mountholeheight);
        translate([ -w_offset, +l_offset, h_offset])
                boxhole(mountwidth, mountheight, mountholewidth, mountholeheight);
    }
}

module basebox(width, length, height, thickness, roundness)
{
    offset = thickness * 2;
    sizeouter = [width + offset, length + offset, height + offset];
    sizeouter2 = [width + offset + thickness, length + offset + thickness, height + offset];
    // increase the height, so that it actually chops the top
    sizeinner = [width, length, height + offset];
 
    // the box itself
    union() {
    difference() {
        roundedcube(sizeouter, true, roundness, false);
        translate([0, 0, thickness]);
    };
    translate([0, 0, height / 2 - 3])
        lidsupport(thickness + 1, thickness, thickness,
                width + thickness * 2 - 1, length + thickness * 2 - 1);
    }
}

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

module pad(x, y, width, height, holewidth)
{
   translate([x, y, height / 2]) difference() {
       //cube(width, center = true);
       cylinder(h = height, r = width/2, center = true);
       cylinder(h = height + 1, r = holewidth/2, center = true);
    }
}

module base(widdth, height)
{   
    sizes = [width, height, 2];
    cube(width, height, 2);
}

module support4(width, height, offsetw, offseth, padwidth, padheight, padmountholewidth) {
    union() {
        pad(0     + offsetw, 0      + offseth, padwidth, padheight, padmountholewidth);
        pad(width - offsetw, 0      + offseth, padwidth, padheight, padmountholewidth);
        pad(0     + offsetw, height - offseth, padwidth, padheight, padmountholewidth);
        pad(width - offsetw, height - offseth, padwidth, padheight, padmountholewidth);
    }
    cube([width, height, 1]);
}

module support2_1(width, height, offsetw, offseth, padwidth, padheight, padmountholewidth) {
    union() {
        pad(0     + offsetw, 0      + offseth, padwidth, padheight, padmountholewidth);
        pad(width - offsetw, 0      + offseth, padwidth, padheight, padmountholewidth);
    }
    cube([width, height, 1]);
}

module support2_2(width, height, offsetw, offseth, padwidth, padheight, padmountholewidth) {
    union() {
        pad(0     + offsetw, height - offseth, padwidth, padheight, padmountholewidth);
        pad(width - offsetw, height - offseth, padwidth, padheight, padmountholewidth);
    }
    cube([width, height, 1]);
}

module support2_3(width, height, offsetw, offseth, padwidth, padheight, padmountholewidth) {
    union() {
        pad(0     + offsetw, 0      + offseth, padwidth, padheight, padmountholewidth);
        pad(0     + offsetw, height - offseth, padwidth, padheight, padmountholewidth);
    }
    cube([width, height, 1]);
}

module support2_4(width, height, offsetw, offseth, padwidth, padheight, padmountholewidth) {
    union() {
        pad(width - offsetw, 0      + offseth, padwidth, padheight, padmountholewidth);
        pad(width - offsetw, height - offseth, padwidth, padheight, padmountholewidth);
    }
    cube([width, height, 1]);
}