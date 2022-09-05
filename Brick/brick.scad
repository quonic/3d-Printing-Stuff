module Brick(width = 2, length = 4)
{
    // 1x1
    x = 7.9;
    // wall thickness
    wt = 1.2;
    difference()
    {
        for (l = [1:width])
        {
            for (w = [1:length])
            {
                difference()
                {
                    union()
                    {
                        // brick base shape
                        cube(size = [ x * l, x * w, 9.6 ]);
                        // brick top nubs
                        translate([ (8 * l) - 4, (8 * w) - 4, 9.6 ]) cylinder(h = 1.7, r = 4.8 / 2);
                    }
                }
            }
        }
        for (l = [1:width])
        {
            for (w = [1:length])
            {
                // brick top nubs inner void
                translate([ (8 * l) - 4, (8 * w) - 4, 9.6 - wt - 0.3 ]) cylinder(h = 2, r = (4.8 / 2) - (wt / 2));
            }
        }
        // brick inner void
        translate(v = [ 1.2, 1.2, -1.2 ]) cube(size = [ (7.9 * width) - 1.2 * 2, (7.9 * length) - 1.2 * 2, 9.6 ]);
    }

    // inner brick braces for each 2x2
    for (l = [1:length - 1])
    {
        if (l % 2 == 0)
        {
            translate(v = [ 0, l * x, 9.6 - 6.3 ]) cube(size = [ width * 7.9, 0.8, 6.3 ]);
        }
    }
    for (w = [1:width - 1])
    {
        if (w % 2 == 0)
        {
            translate(v = [ w * x, 0, 9.6 - 6.3 ]) cube(size = [ 0.8, length * 7.9, 6.3 ]);
        }
    }
}
$fn = 32;

Brick();