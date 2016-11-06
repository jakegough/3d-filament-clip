use <spool_clip.scad>;

default_filament_diameter = 2.0;
default_extrude_depth = 5;
default_shell_thickness = 2;

// going clockwise looking at the clip, with the filament jaw on the right
default_segment_1 = 6;
default_segment_2 = 5.0;
default_segment_3 = 2.5;
default_segment_4 = 2.0;

spool_clip_monoprice();

module spool_clip_monoprice(
    filament_diameter = default_filament_diameter,
    extrude_depth = default_extrude_depth,
    shell_thickness = default_shell_thickness,
    segment_1 = default_segment_1,
    segment_2 = default_segment_2,
    segment_3 = default_segment_3,
    segment_4 = default_segment_4
)
{
    spool_clip(
        filament_diameter = filament_diameter,
        extrude_depth = extrude_depth,
        shell_thickness = shell_thickness,
        segment_1 = segment_1,
        segment_2 = segment_2,
        segment_3 = segment_3,
        segment_4 = segment_4);
}