edge_radius=7.7;

module ta_ba08(c=false) {
    
    center_num=c==true?-16:edge_radius;
    points=[
        [0,0,0],[32,0,0],[32,32,0],[0,32,0],
        [1,1,-9],[31,1,-9],[31,31,-9],[1,31,-9],
        [10,10,-11],[21,10,-11],[21,21,-11],[10,21,-11]
    ];
    translate([center_num, center_num, 0])
    hull() {
        for (i=points) {
            translate(i) cylinder(r=edge_radius, h=1.34, center=true);
        }
        translate([16, 16, 1]) sphere(r=1);
    }
    
}

module clip_holder() {
    union() {
        difference(){
            points=[
                [edge_radius-1,edge_radius-1,0],[33+edge_radius,edge_radius-1,0],[33+edge_radius,33+edge_radius,0],[edge_radius-1,33+edge_radius,0]
            ];
            translate([0, 0, -7])
            hull() {
                for (i=points) {
                    translate(i) cylinder(r=edge_radius, h=20, center=true);
                }
            }
            translate([0, 0, -4])
            ta_ba08(c=false);
            translate([-1, -1, -20])
            cube(size=[50, 25, 20], center=false);
        }
        difference(){
            translate([6, 0, 5]) rotate([0, 90, 0]) cylinder(r=5, h=35, center=false);
            translate([6, 0, 5]) rotate([0, 90, 0]) cylinder(r=2, h=35, center=false);
            translate([6, 0, 0]) cube(size=[35, 10, 6], center=false);
        }
        translate([6, 3, 6])
        cube(size=[35, 40, 3], center=false);
    }
    
    
}

rotate([-90, 0, 0])
clip_holder($fn=128);
