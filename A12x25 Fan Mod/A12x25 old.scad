include <MCAD/units/metric.scad>
use <MCAD/array/along_curve.scad>
use <MCAD/shapes/cylinder.scad>
use <scad-utils/transformations.scad>
use <scad-utils/shapes.scad>
use <MCAD/general/sweep.scad>
use <MCAD/shapes/2Dshapes.scad>

Blade_Height=16.5; // [16.5:100]
Blade_Diameter=110.0; // [50:110]
Number_of_Blades=12; // [6:64]
Blade_Twist_Angle=30; // [0:30]

module Fan(center=false){
    Shaft_Mount_Diameter=37.25;
    Shaft_Mount_Radius=Shaft_Mount_Diameter/2;
    Shaft_Mount_Wall_Thickness=2.0;
    Shaft_Mount_Top_Diameter=31.25;
    Shaft_Mount_Top_Radius=Shaft_Mount_Top_Diameter/2;
    Shaft_Mount_Top_Height=15.0;
    Shaft_Mount_Top_Thickness=1.5;
    translate([0, 0, 16.5/2]) { // Keeps the Mount at the correct Z height
        difference(){
            // Base shape of the mount
            union(){
                cylinder(r=Shaft_Mount_Radius+Shaft_Mount_Wall_Thickness*2, h=Shaft_Mount_Top_Height+Shaft_Mount_Top_Thickness, center=center);
                Blade(Number_of_Blades,Blade_Twist_Angle);
            }
            
            // Remove two cylinders shapes to make the whole shaft mount
            translate([0, 0, -Shaft_Mount_Top_Thickness]) {
                cylinder(r=Shaft_Mount_Radius+Shaft_Mount_Wall_Thickness, h=Shaft_Mount_Top_Height, center=center);
            }
            translate([0, 0, 2]) {
                cylinder(r=Shaft_Mount_Top_Radius, h=Shaft_Mount_Top_Height, center=center);
            }
        }
    }
}

module Blade(n,twist=45){
    Shaft_Mount_Diameter=37.25;
    Shaft_Mount_Radius=Shaft_Mount_Diameter/2;
    Blade_Radius=Blade_Diameter/2;
    Shaft_Mount_Wall_Thickness=2.0;
    // Move the bades up(Z) to align with the mount
    translate([0, 0, Blade_Height]) {
        // Loop through 360 degrees and evenly space each(n) number of blades
        for (i=[0:360/n:360]) {
            // Place each blade
            rotate([180+twist, 0, i]) {
                // Move each blade away from the shaft by it's radius + wall thickness
                translate([Shaft_Mount_Radius, 0, 0]) {
                    // Extrude the blade from 4 points.
                    
                    // TODO: Replace this with a 3D shape, instead of extruding a 2D shape.
                    linear_extrude(height=Blade_Height/cos(twist), scale=[1,0.5], slices=32, twist=twist/2)
                    polygon(points=[
                        [0,0],[0,1],
                        [Blade_Radius+(Shaft_Mount_Wall_Thickness*2),1],[Blade_Radius+(Shaft_Mount_Wall_Thickness*2),0]
                        ]
                    );
                    // TODO: Get the bottom of the blade to join with the motor mount when greater than 38 degrees
                    // Points=[
                    //     [x,y,z],
                    //     [x,y,z],
                    //     [x,y,z],
                    //     [x,y,z],
                    //     [x,y,z],
                    //     [x,y,z],
                    //     [x,y,z],
                    //     [x,y,z]
                    // ]
                    // polyhedron(points=[])
                }
                
            }
        }
    }
}
$fn=64;
Fan();

