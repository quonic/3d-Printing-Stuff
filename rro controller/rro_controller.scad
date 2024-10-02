
button_count = 5;
slider_count = 5;

boarder = 10;
case_wall = 4;

height = 40;
width = boarder + (20 * slider_count) + (10) + boarder;
depth = boarder + 120 + boarder;
size = [ depth, width, height ];


module slider_mounting_holes (count=5){
    dist_from_hole = 3.34;
    slider_slit_width = 3;
    slider_width = 20;
    slider_mounting_hole_radius = 2;
    slider_mounting_hole_spacing = 120;
    translate([ boarder, 0, (boarder*2)+case_wall ])
    for (i = [0:count-1]){
        translate([ 0, (i*slider_width), (boarder/2) ])
        cylinder(r1 = slider_mounting_hole_radius, h = case_wall ,r2 = slider_mounting_hole_radius+2);
        translate([ 0, (i*slider_width), 1 ])
        cylinder(r = slider_mounting_hole_radius, h = 10/2);
        translate([ (slider_mounting_hole_spacing), (i*slider_width), (boarder/2) ])
        cylinder(r1 = slider_mounting_hole_radius, h = case_wall ,r2 = slider_mounting_hole_radius+2);
        translate([ (slider_mounting_hole_spacing), (i*slider_width), 1])
        cylinder(r = slider_mounting_hole_radius, h = 10/2);
        translate([dist_from_hole,(i*slider_width)-(slider_slit_width/2),0])
        cube(size = [slider_mounting_hole_spacing-(dist_from_hole*2), slider_slit_width, 10]);
    }
} $fn = 64;

module buttons(count=3){
    for (i = [0:count-1]){
        translate([ (boarder*2+((20*i)+(10*i/2))), width-boarder-(boarder/2), height-boarder+1 ])
        cylinder(r = 3, h = 10);
    }
}

module case (){
    difference(){
        cube(size);
        translate([ case_wall, case_wall, case_wall-boarder ])
        cube([ depth - (case_wall*2), width - (case_wall*2), height - (case_wall*2)+boarder ]);
        translate([ 0, case_wall*4, 8 ])
        slider_mounting_holes (count=slider_count);
        buttons(count=button_count);
    }
}

case ();
