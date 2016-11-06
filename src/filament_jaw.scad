$fn = 24;

default_filament_diameter = 1.75 + 0.1;
default_extrude_depth = 4;
default_shell_thickness = 2;
default_bevel_radius = 1;

filament_jaw();

module filament_jaw(
    filament_diameter = default_filament_diameter,
    extrude_depth = default_extrude_depth,
    shell_thickness = default_shell_thickness,
    bevel_radius = default_bevel_radius,
    wall_size = 10)
{
    filament_jaw_od = filament_diameter + (shell_thickness * 2);
    filament_jaw_or = filament_jaw_od / 2; 
    filament_jaw_id = filament_diameter;
    filament_jaw_ir = filament_jaw_id / 2;

    translate([filament_jaw_or, wall_size - filament_jaw_or, 0])
    difference()
    {
        body();
        hole();
    }

    module body()
    {
        hull()
        {
            translate([
                -filament_jaw_or,
                filament_jaw_or - wall_size,
                0])
            cube([
                shell_thickness,
                wall_size,
                extrude_depth]);

            cylinder(
                r = filament_jaw_or, 
                h = extrude_depth);
        }
        
    }

    module hole()
    {
        translate([0, 0, -0.01])
        cylinder(
            r1 = filament_jaw_ir + bevel_radius,
            r2 = filament_jaw_ir, 
            h = bevel_radius);

        translate([0, 0, extrude_depth - bevel_radius + 0.01])
        cylinder(
            r1 = filament_jaw_ir,
            r2 = filament_jaw_ir  + bevel_radius, 
            h = bevel_radius);

        translate([0, 0, -1])
        cylinder(
            r = filament_jaw_ir, 
            h = extrude_depth + 2);

        rotate(180,0,0)
        translate([-filament_jaw_or, 0, -1])        
        cylinder(
            r = filament_jaw_or, 
            h = extrude_depth + 2,
            $fn = 4);
    }
}