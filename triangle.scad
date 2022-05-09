module triangle(o_len, a_len, depth, center=false)
{
    centroid = center ? [-a_len/3, -o_len/3, -depth/2] : [0, 0, 0];
    rotate([0, 90, 0])translate(centroid) linear_extrude(height=depth)
    {
        polygon(points=[[0,0],[a_len,0],[0,o_len]], paths=[[0,1,2]]);
    }
}

module lidsupportline(width, height, thickness, depth)
{
    centroid = [-depth/2, 0, 0];
    translate(centroid) rotate([90, 0, 0]) rotate([0, 90, 0]) linear_extrude(height=depth)
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
lidsupport(4, 2, 2, 30, 60);
//trianglebox(2, 2, 50);