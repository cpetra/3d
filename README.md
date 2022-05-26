# 3dbox
Utilities for creating electronic boxes, using OpenSCAD

# Usage

Creating a box of inner size 70 x 80 x 30 mm:
```
./export_box.sh 70 80 30
```
This will generate three stl files that can be imported in any slicer:

*box_box_70_80_30.stl*

*box_lid_70_80_30.stl*

*boxlh_lid_70_80_30.stl*

Other parameters can be set, have a look at the code.


## Results of the export

- Body
<img src="https://github.com/cpetra/3d/blob/master/data/box_body.png?raw=true" alt="body" style="width:400px;"/>

- Filled lid
<img src="https://github.com/cpetra/3d/blob/master/data/lid1.png?raw=true" alt="body" style="width:400px;"/>

- Lid with holes

<img src="https://github.com/cpetra/3d/blob/master/data/lid2.png?raw=true" alt="body" style="width:400px;"/>

Credits:
 - Roundedcube: https://danielupshaw.com/openscad-rounded-corners/
