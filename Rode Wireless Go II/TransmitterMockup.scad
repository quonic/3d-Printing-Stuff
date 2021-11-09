module Tx(hideHoles=false,extendUsbHole=false) {
    // Base
    BaseX=44;
    BaseY=44;
    BaseZ=14.5;
    UsbX = (BaseX/2)-(8.25/2);
    UsbY = BaseZ/2;
    UsbZ = 0;

    union(){
        difference() {
            cube(size=[BaseX, BaseY, BaseZ], center=false);
            if(hideHoles){
                
            }else{
                rotate([90, 0, 90]) {
                    hull() {
                        translate([UsbX, UsbY, UsbZ]) {
                            cylinder(d=2.18, h=6.25, center=false, $fn=32);
                        }
                        translate([UsbX+8.25-(2.18), UsbY, UsbZ]) {
                            cylinder(d=2.18, h=6.25, center=false, $fn=32);
                        }
                    }
                }
                // USB C
                rotate([90, 0, 0]) {
                    translate([8.45, BaseZ/2, 0]) {
                        cylinder(d=3.5, h=14, center=false, $fn=32);
                    }
                }
            }
        }
        // USB C
        if(extendUsbHole){
            translate([-6.25, 0, 0]) {
                rotate([90, 0, 90]) {
                    hull() {
                        translate([UsbX, UsbY, UsbZ]) {
                            cylinder(d=2.18*3, h=6.25, center=false, $fn=32);
                        }
                        translate([UsbX+8.25-(2.18), UsbY, UsbZ]) {
                            cylinder(d=2.18*3, h=6.25, center=false, $fn=32);
                        }
                    }
                }    
            }
        }
        
        // Clip
        translate([((BaseX-18.43)/2), 0, -(3+2)]) {
            cube(size=[18.43, 34, 2], center=false);
            translate([0, 0, 2]) {
                translate([3, 21, 0]) cylinder(r=1, h=2, center=false, $fn=32);
                translate([(15+3)/2, 21, 0]) cylinder(r=1, h=2, center=false, $fn=32);
                translate([15, 21, 0]) cylinder(r=1, h=2, center=false, $fn=32);
            }
            translate([0, 10, 2]) {
                translate([3, 21, 0]) cylinder(r=1, h=2, center=false, $fn=32);
                translate([(15+3)/2, 21, 0]) cylinder(r=1, h=2, center=false, $fn=32);
                translate([15, 21, 0]) cylinder(r=1, h=2, center=false, $fn=32);
            }
            translate([0, 0, 0]) {
                translate([-18/2, 0, 0]) {
                    cube(size=[9, 9, 5], center=false);
                }
                translate([18.43, 0, 0]) {
                    cube(size=[9, 9, 5], center=false);
                }
            }
        }
    }
}
