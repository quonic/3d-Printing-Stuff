from math import *
import os

from solid import *
from solid.utils import *

Blade_Height = 16.5
Blade_Diameter = 110.0
Number_of_Blades = 32
Blade_Twist_Angle = 30
shaft_mount_top_height = 15.0


def fan(center=False):
    shaft_mount_diameter = 37.25
    shaft_mount_radius = shaft_mount_diameter / 2
    shaft_mount_wall_thickness = 2.0
    shaft_mount_top_diameter = 31.25
    shaft_mount_top_radius = shaft_mount_top_diameter / 2

    shaft_mount_top_thickness = 1.5

    return translate((0, 0, 16.5 / 2)) + difference()(
        union()(
            cylinder(r=shaft_mount_radius + shaft_mount_wall_thickness * 2,
                     h=shaft_mount_top_height + shaft_mount_top_thickness, center=center),
            blade(Number_of_Blades, 45)
        ),
        translate((0, 0, 0 - shaft_mount_top_thickness))(
            cylinder(r=shaft_mount_radius + shaft_mount_wall_thickness, h=shaft_mount_top_height, center=center)),
        translate((0, 0, 2))(
            cylinder(r=shaft_mount_top_radius, h=shaft_mount_top_height, center=center))

        # )
    )


def blade(n, twist=45) -> OpenSCADObject:
    ret = []
    shaft_mount_diameter = 37.25
    shaft_mount_radius = shaft_mount_diameter / 2
    blade_radius = Blade_Diameter / 2
    shaft_mount_wall_thickness = 2.0

    for i in range(0, 360, round(360 / n)):
        ret = ret + rotate((0, 90, i))(
            translate((0.5, 0, 0))(
                rotate((0, 0, twist))(
                    translate((0, 0, shaft_mount_radius + shaft_mount_wall_thickness-10))(
                        hull()(
                            translate((0, 0, 0))(
                                cylinder(h=blade_radius+10, r=0.5)
                            ),
                            translate((sqrt((Blade_Height*sin(radians(twist)))**2 + Blade_Height**2)/3, 1, 0))(
                                cylinder(h=blade_radius+10, r=0.5)
                            ),  # (shaft_mount_top_height*tan(twist)
                            translate((sqrt((Blade_Height*sin(radians(twist)))**2 + Blade_Height**2)-1, 0, 0))(
                                cylinder(h=blade_radius+10, r=0.5)
                            )
                        )
                    )
                )
            )
        )

    return translate((0, 0, Blade_Height))(ret)


# Save scad file to same path as this script
export_file_name = "A12x25.scad"
path = os.path.realpath(__file__).replace(
    os.path.basename(__file__), export_file_name)
scad_render_to_file(fan(), path)
