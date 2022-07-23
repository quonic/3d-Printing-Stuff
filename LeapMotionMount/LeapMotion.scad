$fn = 64;
CornerRadius = 6.5;
translate([ 0, 0, 0 ]) hull()
{
    translate([ 0 - CornerRadius, 0, 0 ]) cylinder(r = 6.5, h = 11.4, center = true);
    translate([ 30 - CornerRadius, 0, 0 ]) cylinder(r = 6.5, h = 11.4, center = true);
    translate([ 0 - CornerRadius, 80 - CornerRadius, 0 ]) cylinder(r = 6.5, h = 11.4, center = true);
    translate([ 30 - CornerRadius, 80 - CornerRadius, 0 ]) cylinder(r = 6.5, h = 11.4, center = true);
};

translate([ -15, 13, -1 ]) rotate([ 0, 90, 0 ])
{
    hull()
    {
        cylinder(r = 1, h = 10, center = true);
        translate([ 0, 5, 0 ]) cylinder(r = 1, h = 10, center = true);
    }
}