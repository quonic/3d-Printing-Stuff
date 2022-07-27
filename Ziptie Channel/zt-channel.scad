// $fn = 30;
// Assumes 1 = 1mm
// Only 2.5, 3, and 3.6 supported. Add other dimentions to module channel as needed.
module channel(width = 5, ztwidth = 3.6)
{
    // width is the distance from one whole to the other
    // ztwidth is the width of the ziptie
    if (ztwidth == 2.5)
    {
        thickness = 1;
        // Ziptie 2.5mm x 1
        channel_corner(ztwidth, width, thickness);
        mirror([ 0, 1, 0 ]) channel_corner(ztwidth, width, thickness);
    }
    else
    {
        if (ztwidth == 3)
        {
            thickness = 1;
            // Ziptie 3mm x 1
            channel_corner(ztwidth, width, thickness);
            mirror([ 0, 1, 0 ]) channel_corner(ztwidth, width, thickness);
        }
        else
        {
            if (ztwidth == 3.6)
            {
                thickness = 1.2;
                // Ziptie 3.6mm x 1.2
                channel_corner(ztwidth, width, thickness);
                mirror([ 0, 1, 0 ]) channel_corner(ztwidth, width, thickness);
            }
            else
            {
                echo("Only 2.5, 3, and 3.6 supported.");
            }
        }
    }
}
module channel_corner(width = 1, radius = 2, thickness = 1)
{
    difference()
    {
        cylinder(h = width, r = radius + thickness);
        translate([ 0, 0, -0.1 ]) cylinder(h = width + 0.2, r = radius);

        translate([ 0, -(1.2 + radius), -0.1 ]) cube([ (1.3 + radius), (1.1 + radius), (width + 0.2) ], false);

        mirror([ 0, 1, 0 ]) translate([ 0, -(1.2 + radius), -0.1 ])
            cube([ (1.3 + radius), (1.4 + radius), (width + 0.2) ], false);

        mirror([ 1, 0, 0 ]) rotate(90) translate([ 0, -(1.2 + radius), -0.1 ])
            cube([ (1.3 + radius), (1.3 + radius), (width + 0.2) ], false);
    }
}