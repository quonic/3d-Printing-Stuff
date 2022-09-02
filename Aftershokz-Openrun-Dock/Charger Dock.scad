// Aftershokz Aeropex/Openrun and Openrun Pro Charger Dock

Device = "Openrun"; // ["Openrun","Openrun Pro"]

module Charger()
{
    // Charger Dimentions
    Width = 7.32;
    Length = 21.57;
    Height = 6;
    EndRadius = 3.7;

    hull()
    {
        translate([ 0, -EndRadius, 0 ])
        {
            cube(size = [ Width, Length - EndRadius, Height ], center = true);
        }
        translate([ 0, Length / 2 - EndRadius, 0 ])
        {
            cylinder(r = EndRadius, h = 6, center = true);
        }
    }
}
$fn = 64;
Width = 35;
Length = 24;
Height = 10;
Triangle = [ [ 0, 0 ], [ Length / 2, 0 ], [ Length / 2, Height ] ];

difference()
{
    if (Device == "Openrun")
    {
        // Openrun
        // Base
        difference()
        {
            translate([ 0, 0, -2.1 ])
            {
                cube(size = [ Width, Length, Height ], center = true);
            }
            // Charger holder
            Charger();
        }
    }
    else
    {
        // Openrun Pro
        // Base
        difference()
        {
            hull()
            {
                translate([ 0, 0, -2.1 ])
                {
                    cube(size = [ Width, Length, Height ], center = true);
                    translate([ 0, 0, 10 ]) rotate([ 90, 0, 90 ])
                        linear_extrude(height = Width, center = true, convexity = 10, scale = [ 1, 1 ], $fn = 100)
                            polygon(Triangle);
                }
            }
            // Charger holder
            translate([ 0, 1, 1 ]) rotate([ 32, 0, 0 ]) translate([ 0, 3.5, 5.6 ])
            {
                translate([ 0, -10, 0 ]) Charger();
                Charger();
            }
        }
    }

    // Magnet D10x3mm insert hole
    mirror([ 1, 0, 0 ])
    {
        translate([ 10, 0, -(Height / 2 + 0.7) ])
        {
            cylinder(r = 10.05 / 2, h = 3, center = true);
        }
    }
    // Mag D10x3mm insert hole
    mirror([ 0, 0, 0 ])
    {
        translate([ 10, 0, -(Height / 2 + 0.7) ])
        {
            cylinder(r = 10.05 / 2, h = 3, center = true);
        }
    }
}