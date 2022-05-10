use <mymodules.scad>

width = 65;
length = 100;
height = 30;

thickness = 2; // thickness
roundness = 2; // roundness

// mounting hole parameters
mountheight = 8;
mountwidth = 6;
mountholewidth = 2;
mountholeheight = 6;

// lid parameters
lidmode = 0; // true if you want the lid, false if you want the box
  lid_holes = 12; // how many aeration holes stripes to be opened on the lid
  lid_percentfill = 50; // percent of aeration in the lid
  lid_holeoffset = 5; // in mm, the offset from the margin of the box

if (!lidmode) {
    circuitbox(width, length, height, thickness, roundness,
                    mountwidth, mountheight, mountholewidth, mountholeheight);
}
else {
    if (lid_holes != 0) {
        boxlid_open(width, length, thickness, mountwidth, mountholewidth, lid_holes, lid_holeoffset, lid_percentfill);
    }
    else {
        boxlid(width, length, thickness, mountwidth, mountholewidth);
    }
}
