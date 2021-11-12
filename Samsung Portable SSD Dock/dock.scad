T7s=2;
T5s=2;

// Global variables
/* [Hidden] */
Wall_Thickness = 2;
UsbC_Height = 2.81 + 0.5;
UsbC_Width = 8.61 + 0.5;
UsbC_Length = 2.48*2;
UsbC_CornerRadius = UsbC_Height/2;


module drive(width,length,height,radius) {
    $fn = 64;
    // Model of the Samsung Portable SSD T7/T5
    
    // difference() {
        // Casing
        hull() {
            mirror([0, 0, 0]) translate([width/2-height/2, 0, 0]) rotate([90,0,0]) cylinder(r=height/2, h=length, center=true);
            mirror([1, 0, 0]) translate([width/2-height/2, 0, 0]) rotate([90,0,0]) cylinder(r=height/2, h=length, center=true);
        }
        // USB-C connector
        translate([0, length/2-UsbC_Length, 0]) {
            hull() {
                UsbC_PortHull = 50;
                mirror([0, 0, 0]) translate([UsbC_Width/2-UsbC_CornerRadius, 0, 0]) rotate([90,0,0]) cylinder(r=UsbC_CornerRadius, h=UsbC_Length+UsbC_PortHull, center=true);
                mirror([1, 0, 0]) translate([UsbC_Width/2-UsbC_CornerRadius, 0, 0]) rotate([90,0,0]) cylinder(r=UsbC_CornerRadius, h=UsbC_Length+UsbC_PortHull, center=true);
            }
        }
        // USB-C connector resess
        translate([0, (length/2)+(UsbC_Length*2)-2, 0]) {
            hull() {
                UsbC_PortHull = 11;
                mirror([0, 0, 0]) translate([UsbC_Width/2-UsbC_CornerRadius, 0, 0]) rotate([90,0,0]) cylinder(r=UsbC_CornerRadius+3, h=UsbC_Length+UsbC_PortHull, center=true);
                mirror([1, 0, 0]) translate([UsbC_Width/2-UsbC_CornerRadius, 0, 0]) rotate([90,0,0]) cylinder(r=UsbC_CornerRadius+3, h=UsbC_Length+UsbC_PortHull, center=true);
            }
        }
    // }
}

module dock(type="T7",count=10) {
    // uses the drive() module to generate a dock
    

    Drive_Height = (type=="T7" ? 8 : 10.5) + 0.5;
    Drive_Width = 57 + 0.5;
    Drive_Length = (type=="T7" ? 85 : 74);
    Drive_CornerRadius = Drive_Height/2;

    Holder_Height = Wall_Thickness+(Drive_Height+Wall_Thickness)*count;
    Holder_Length = Drive_Length+Wall_Thickness*2;
    Holder_Width = Drive_Width+Wall_Thickness*2;

    difference() {
        // Holder
        translate([0, 5, Holder_Height/2]) {
            cube(size=[Holder_Width, Holder_Length-10, Holder_Height], center=true);
        }
        // Drives
        for (i=[1:1:count]) {
            translate([0, 0, i*(Drive_Height+Wall_Thickness)-Drive_Height/2]) {
                drive(Drive_Width,Drive_Length,Drive_Height,Drive_CornerRadius);
            }
        }
        // #translate([0, Holder_Length/2, Holder_Height/2]) {
        //     cube(size=[UsbC_Width*2, 10, Holder_Height], center=true);
        // }
    }
}

if(T7s>0) {
    dock(type="T7", count=T7s);
}
if(T5s>0) {
    translate([0, 0, Wall_Thickness+(8 + 0.5+Wall_Thickness)*T7s]) {
        dock(type="T5", count=T5s);
    }
}