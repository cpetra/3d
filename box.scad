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

// circuit parameters
preview = true; // set to false if printing this
lidmode = 1; // true if you want the lid, false if you want the box
  lid_holes = 0; // how many aeration holes stripes to be opened on the lid
  lid_percentfill = 40; // percent of aeration in the lid
  lid_holeoffset = 5; // in mm, the offset from the margin of the box
 
lidfill = 50;
c_width = 46;
c_length = 25;
c_holewidth = 3;
c_holemargin = 1.5;




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
