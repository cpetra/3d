# 3dbox
My 3d utilities, for creating electronic boxes, using OpenSCAD

Usage (to create a box of inner size 70 x 80 x 30 mm:
```
./export_box.sh 70 80 30
```
This will create three stl files that can be imported in any slicer:

*box_box_70_80_30.stl*

*box_lid_70_80_30.stl*

*boxlh_lid_70_80_30.stl*
```
Many other parameters can be set, have a look at the code.
```

Results of the body export

![body](https://github.com/cpetra/3d/blob/master/data/box_body.png)

Filled lid

![body](https://github.com/cpetra/3d/blob/master/data/lid1.png)

Lid with holes

![body](https://github.com/cpetra/3d/blob/master/data/lid2.png)

Credits:
 - Roundedcube: https://danielupshaw.com/openscad-rounded-corners/
