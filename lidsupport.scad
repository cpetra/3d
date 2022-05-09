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
lidsupport(3, 2, 2,50, 60);
//trianglebox(2, 2, 50);