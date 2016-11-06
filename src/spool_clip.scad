use <filament_jaw.scad>;

default_filament_diameter = 2.0;
default_extrude_depth = 4;
default_shell_thickness = 2;

// going clockwise looking at the clip, with the filament jaw on the right
default_segment_1 = 5;
default_segment_2 = 5;
default_segment_3 = 5;
default_segment_4 = 5;

spool_clip();

module spool_clip(
    filament_diameter = default_filament_diameter,
    extrude_depth = default_extrude_depth,
    shell_thickness = default_shell_thickness,    
    segment_1 = default_segment_1,
    segment_2 = default_segment_2,
    segment_3 = default_segment_3,
    segment_4 = default_segment_4
)
{
    union()
    {
        draw_segment_1();    
        draw_segment_2();    
        draw_segment_3();    
        draw_segment_4();    
        draw_segment_5();    
        draw_filament_jaw();
    }
    
    module draw_segment_1()
    {
        //color([1,0,0])
        cube([
            shell_thickness, 
            segment_1, 
            extrude_depth]);
    }
    
    module draw_segment_2()
    {
        //color([0,1,0])
        translate([
            shell_thickness - segment_2, 
            segment_1 - shell_thickness, 
            0])
        cube([
            segment_2, 
            shell_thickness, 
            extrude_depth]);
    }
    
    module draw_segment_3()
    {
        //color([0,0,1])
        translate([
            -(segment_2), 
            segment_1 - shell_thickness, 
            0])
        cube([
            shell_thickness, 
            segment_3 + shell_thickness, 
            extrude_depth]);
    }
    
    module draw_segment_4()
    {
        //color([1,1,0])
        translate([
            -(segment_2), 
            segment_1 + segment_3, 
            0])
        cube([
            segment_4 + segment_2 + shell_thickness,
            shell_thickness,  
            extrude_depth]);
    }
    
    module draw_segment_5()
    {
        //color([0,1,1])
        translate([
            segment_4 + shell_thickness, 
            0, 
            0])
        difference()
        {
            cube([
                shell_thickness, 
                segment_1 + segment_3 + shell_thickness, 
                extrude_depth]);

            rotate(-45)
            translate([
                0,
                0,
                -1
            ])
            cube([
                shell_thickness * 2, 
                shell_thickness * 2, 
                extrude_depth + 2]);            
        }
    }    

    module draw_filament_jaw()
    {
        diameter = filament_diameter + (shell_thickness * 2);
        radius = diameter / 2;

        //color([1,0,1])
        translate([
            segment_4 + shell_thickness, 
            shell_thickness, 
            0])
        filament_jaw(
            filament_diameter = filament_diameter,
            shell_thickness = shell_thickness,
            extrude_depth = extrude_depth,
            wall_size = segment_1 + segment_3);
    }
}