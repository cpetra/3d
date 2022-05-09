# export the box.scad to box_box.stl and box_lid.stl

if [[ "$#" < '3' ]]; then
    echo "Usage: " $0 " width length height"
    echo "  Where: "
    echo "  width = the inner width of the box, in mm"
    echo "  length = the inner length of the box, in mm"
    echo "  height = the inner height of the box, in mm"
    exit 0
fi

width="$1"
length="$2"
height="$3"

/usr/bin/openscad -D "lidmode=0" -D "width=${width}" -D "length=${length}" -D "height=${height}" -o box_box_${width}_${length}_${height}.stl box.scad
/usr/bin/openscad -D 'lidmode=1' -D "width=${width}" -D "length=${length}" -D "height=${height}" -o box_lid_${width}_${length}_${height}.stl box.scad

