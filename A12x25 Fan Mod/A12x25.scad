Shaft_Mount_Diameter=37.25;
Shaft_Mount_Radius=Shaft_Mount_Diameter/2;
Shaft_Mount_Wall_Thickness=2.0;
Shaft_Mount_Top_Diameter=31.25;
Shaft_Mount_Top_Radius=Shaft_Mount_Top_Diameter/2;
Shaft_Mount_Top_Height=15.0;
Shaft_Mount_Top_Thickness=1.5;

Blade_Height=16.5; // [16.5:100]
Blade_Diameter=110.0; // [50:110]
Blade_Radius=Blade_Diameter/2;
Number_of_Blades=12; // [6:64]

module Shaft_Mount(center=true){
    translate([0, 0, 16.5/2]) {
        difference(){
            cylinder(r=Shaft_Mount_Radius+Shaft_Mount_Wall_Thickness*2, h=Shaft_Mount_Top_Height+Shaft_Mount_Top_Thickness, center=true);
            translate([0, 0, -Shaft_Mount_Top_Thickness]) {
                cylinder(r=Shaft_Mount_Radius+Shaft_Mount_Wall_Thickness, h=Shaft_Mount_Top_Height, center=true);
            }
            translate([0, 0, 2]) {
                cylinder(r=Shaft_Mount_Top_Radius, h=Shaft_Mount_Top_Height, center=center);
            }
        }
    }
}

module Blade(n){
    translate([0, 0, Blade_Height]) {
        for (i=[0:360/n:360]) {
            rotate([180, 0, i]) {
                translate([Shaft_Mount_Radius+2, 0, 0]) {
                    linear_extrude(height=Blade_Height, scale=[1,0.5], slices=20, twist=45)
                    polygon(points=[
                        [0,0],[0,1],
                        [Blade_Radius-1,4],[Blade_Radius-1,3]
                        ]);
                }
                
            }
        }
    }
 
}

Shaft_Mount();
Blade(Number_of_Blades);
