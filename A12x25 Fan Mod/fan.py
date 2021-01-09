from math import *

from solid import *
from solid.utils import *

Blade_Height = 16.5
Blade_Diameter = 110.0
Number_of_Blades = 12
Blade_Twist_Angle = 30


def fan(center=False):
    shaft_mount_diameter = 37.25
    shaft_mount_radius = shaft_mount_diameter / 2
    shaft_mount_wall_thickness = 2.0
    shaft_mount_top_diameter = 31.25
    shaft_mount_top_radius = shaft_mount_top_diameter / 2
    shaft_mount_top_height = 15.0
    shaft_mount_top_thickness = 1.5

    return translate((0, 0, 16.5 / 2)) + difference()(
        union()(
            cylinder(r=shaft_mount_radius + shaft_mount_wall_thickness * 2,
                     h=shaft_mount_top_height + shaft_mount_top_thickness, center=center),
            blade(1, 45)
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
        ret = ret + rotate((180 + twist, 0, i))(
            translate((shaft_mount_radius, 0, 0))(
                # TODO: Replace this with a 3D shape, instead of extruding a 2D shape.
                linear_extrude(height=(Blade_Height / cos(twist)), scale=1, slices=200, twist=(twist / 2))(
                    polygon(points=[
                        (0, 0),
                        (0, 1),
                        (blade_radius + (shaft_mount_wall_thickness * 2), 1),
                        (blade_radius + (shaft_mount_wall_thickness * 2), 0)]))))
    return translate((0, 0, Blade_Height))(ret)


scad_render_to_file(fan(), "test.scad")
# scad_render_to_file(blade(6), "test.scad")
