Drive_Count=2;
Drive_Type="T7"; // [T5, T7]
Filament_Type="PLA"; // [ABS, PLA]
// Global variables
/* [Hidden] */
Drive_Height = (Drive_Type=="T7" ? 8 : 10.5) + (Filament_Type=="PLA" ? 0.5 : 0);
Drive_Width = (Drive_Type=="T7" ? 57 : 57) + (Filament_Type=="PLA" ? 0.5 : 0);
Drive_Length = Drive_Type=="T7" ? 85 : 74;
Drive_CornerRadius = Drive_Height/2;
UsbC_Height = 2.81 + (Filament_Type=="PLA" ? 0.5 : 0);
UsbC_Width = 8.61 + (Filament_Type=="PLA" ? 0.5 : 0);
UsbC_Length = 2.48*2;
UsbC_CornerRadius = UsbC_Height/2;


module drive() {
    $fn = 64;
    // Model of the Samsung Portable SSD T7
    
    // difference() {
        // Casing
        hull() {
            mirror([0, 0, 0]) translate([Drive_Width/2-Drive_CornerRadius, 0, 0]) rotate([90,0,0]) cylinder(r=Drive_CornerRadius, h=Drive_Length, center=true);
            mirror([1, 0, 0]) translate([Drive_Width/2-Drive_CornerRadius, 0, 0]) rotate([90,0,0]) cylinder(r=Drive_CornerRadius, h=Drive_Length, center=true);
        }
        // USB-C connector
        translate([0, Drive_Length/2-UsbC_Length, 0]) {
            hull() {
                UsbC_PortHull = 50;
                mirror([0, 0, 0]) translate([UsbC_Width/2-UsbC_CornerRadius, 0, 0]) rotate([90,0,0]) cylinder(r=UsbC_CornerRadius, h=UsbC_Length+UsbC_PortHull, center=true);
                mirror([1, 0, 0]) translate([UsbC_Width/2-UsbC_CornerRadius, 0, 0]) rotate([90,0,0]) cylinder(r=UsbC_CornerRadius, h=UsbC_Length+UsbC_PortHull, center=true);
            }
        }
        // USB-C connector resess
        translate([0, (Drive_Length/2)+(UsbC_Length*2)-2, 0]) {
            hull() {
                UsbC_PortHull = 9;
                mirror([0, 0, 0]) translate([UsbC_Width/2-UsbC_CornerRadius, 0, 0]) rotate([90,0,0]) cylinder(r=UsbC_CornerRadius+3, h=UsbC_Length+UsbC_PortHull, center=true);
                mirror([1, 0, 0]) translate([UsbC_Width/2-UsbC_CornerRadius, 0, 0]) rotate([90,0,0]) cylinder(r=UsbC_CornerRadius+3, h=UsbC_Length+UsbC_PortHull, center=true);
            }
        }
    // }
}

module dock(count=10) {
    // uses the drive() module to generate a dock
    Wall_Thickness = 2;
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
                drive();
            }
        }
        // #translate([0, Holder_Length/2, Holder_Height/2]) {
        //     cube(size=[UsbC_Width*2, 10, Holder_Height], center=true);
        // }
    }
    
}
dock(Drive_Count);