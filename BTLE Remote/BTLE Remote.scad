// 51mm x 23mm x 7.18mm(1.6mm board thickness)
// Feather - Adafruit: Adafruit Feather 32u4 Bluefruit LE
translate([0, 0, 0])
union(){
    color([10/255, 20/255, 20/255])
    cube(size=[51, 23, 1.6], center=true);
    translate([-20, 8.5, 4])
    cube(size=[8, 6.1, 5.8], center=true);
}


// 62mm x 34mm  x 5mm
// Battery - Adafruit: Lithium Ion Polymer Battery - 3.7v 1200mAh
color([200/255, 200/255, 200/255])
translate([0, 0, -4])
cube(size=[62, 34, 5], center=true);

translate([9, 0, 0])
union(){
    // 59mm x 23mm x 1.3mm
    // Button Board
    color([0/255, 100/255, 0/255])
    translate([0, 0, 5.5])
    cube(size=[40, 23, 1.3], center=true);

    // 6.0mm x 6.1mm x 3.0mm
    // Button - Adafruit: Tactile Button switch (6mm) x 20 pack
    // Doesn't include legs or button ontop

    for (x=[0:3]) {
        for (y=[0:1]) {
            translate([(x*8)-12, (y*8)-4.1, 8])
            union(){
                button();
            }
        }
    }

}

module button() {
    color([0/255, 0/255, 0/255])
    cube(size=[6, 6.1, 3], center=true);
    translate([0, 0, 1.8])
    color([255/255, 255/255, 255/255])
    cylinder(d=3.4, h=1.8, center=true, $fn=16);
}