// Aftershokz Aeropex Charger Dock
$fn = 64;
module Charger() {
    // Charger Dimentions
    Width = 7.32;
    Length = 21.57;
    Height = 6;
    EndRadius = 3.7;
    

    hull() {
        translate([0, -EndRadius, 0]) {
            cube(size=[Width, Length-EndRadius, Height], center=true);
        }
        translate([0, Length/2-EndRadius, 0]) {
            cylinder(r=EndRadius, h=6, center=true);
        }
    }    
}
Width = 35;
Length = 24;
Height = 10;

difference() {
    translate([0, 0, -2.1]) {
        cube(size=[Width, Length, Height], center=true);
    }
    
    Charger();
    mirror([1, 0, 0]) {
        translate([10, 0, -(Height/2+0.7)]) {
            cylinder(r=10.05/2, h=3, center=true);
        }
    }
    mirror([0, 0, 0]) {
        translate([10, 0, -(Height/2+0.7)]) {
            cylinder(r=10.05/2, h=3, center=true);
        }
    }
}


