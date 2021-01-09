preview = true; // [true:false]

function centered(bool) = (bool) ? 0 : 3 ;

module button(center=false) {
    cube(size=[6, 6.1, 3], center=center);
    
    translate([centered(center), centered(center), 1.8])
    cylinder(d=3.4, h=1.8, center=center, $fn=16);
}

// Comment out this button before printing
%translate([0, 0, (preview) ? -10 : 0]) button(center=true);

// Comment out either holder or cap to 3D print which ever you want to print
translate([0, 0, (preview) ? -5 : 0]) holder();

cap();

module holder(center=true) {
    difference(){
        translate([0, 0, 3])
        cube(size=[7, 7, 3], center=true);

        translate([centered(center), centered(center), 3])
        cylinder(d=3.4, h=3.1, center=center, $fn=16);
        translate([1.5, 0, 3.2])
        cube(size=[1, 1, 2], center=true);
        
        translate([-1.5, 0, 3.2])
        cube(size=[1, 1, 2], center=true);
    }
    

}
module cap(center=true) {
    union(){
        translate([centered(center), centered(center), 3.7])
        cylinder(d=3.4, h=2, center=center, $fn=16);
        
        translate([0, 0, 5.1])
        cube(size=[7, 7, 1], center=true);
        
        difference(){
            translate([1.5, 0, 3.2])
            cube(size=[1, 1, 1], center=true);
            
            translate([2.1, 0, 2.5])
            rotate([0, -70, 0])
            cube(size=[3, 2, 1], center=true);
        }
        
        difference(){
            translate([-1.5, 0, 3.2])
            cube(size=[1, 1, 1], center=true);

            translate([-2.1, 0, 2.5])
            rotate([0, 70, 0])
            cube(size=[3, 2, 1], center=true);
            
        }
        
    }
}