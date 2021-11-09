include <TransmitterMockup.scad>
include <threads.scad>

difference() {
    cube(size=[50, 60, 20], center=false);
    translate([3, 0, 10]) {
        Tx(hideHoles=true,extendUsbHole=true);
    }
    translate([15.75, 0, 3]) {
        cube(size=[18.45, 34, 2], center=false);
    }
    translate([15.75, 0, 7]) {
        #cube(size=[19, 9, 4], center=false);
    }
    translate([50/2, 60-8, 10]) {
        rotate([-90, 0, 0]) {
            english_thread(1/4,20,1/3);
        }
    }
}
