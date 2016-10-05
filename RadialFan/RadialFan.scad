paddle_planes = 10;
turbine_length = 60;
turbine_radius = 60;
turbine_diameter = turbine_radius * 2;
rotation = 180 / paddle_planes;
spindle_radius = 5;
jet_radius = turbine_radius / 2;
sheet_thickness = 2;

difference() {
    union() {
        // paddles
        for (i = [rotation:rotation:paddle_planes * rotation])
            rotate([0, i, 0])
                cube([sheet_thickness, turbine_length, turbine_diameter], center=true);
        
        // end plates
        translate([0, turbine_length / 2, 0])
        rotate([90, 0, 0])
        cylinder(sheet_thickness, turbine_radius, center=false);
        translate([0, -turbine_length / 2, 0])
        rotate([90, 0, 0])
        cylinder(sheet_thickness, turbine_radius, center=false);
    }
    // remove inner cone
    rotate([-90, 0, 0])
    cylinder(turbine_length + 5, jet_radius, spindle_radius, center=true);
}