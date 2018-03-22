$fn=64;

// defaults to aa battery
$outer_heigth=49.5;
$outer_radius=7;
$inner_radius=$outer_radius - 2;

$strainrelief_thickness=3;
$strainrelief_height=3;
$strainrelief_length=6;

$plusterminal_h=3;
$plusterminal_drilling=true;
$plusterminal_r=2.5;
// without drilling a pin is added
$plusterminal_pin_h=3;
$plusterminal_pin_r=2.5;

$minusterminal_h1=3;
$minusterminal_h2=2;
$minusterminal_drilling=true;
$minusterminal_r1=2.8; // was 3
$minusterminal_r2=6;   // was 5


$inner_heigth=$outer_heigth-$plusterminal_h-$minusterminal_h1-$minusterminal_h2;

module strainrelief(h=6, l=8, t=4, holes=1.5) {
    translate([0, $inner_radius-$outer_radius+h/2, 0]) difference() {
    hull() {
      cube([t*2, 1, l*2], center=true);
      translate([0, h, -l/2]) rotate([0, 90, 0]) cylinder(h=t, r=l/2, center=true);
      translate([0, h, +l/2]) rotate([0, 90, 0]) cylinder(h=t, r=l/2, center=true);
    }
      translate([0, h, +(holes+1)]) rotate([0, 90, 0]) cylinder(h=t*2+2, r=holes, center=true);
          translate([0, h, -(holes+1)]) rotate([0, 90, 0]) cylinder(h=t*2+2, r=holes, center=true);

    }
}


difference() {
translate([0, 0, $plusterminal_h-($plusterminal_h+$minusterminal_h1+$minusterminal_h2)/2]) {
    union() {
    cylinder(h=$outer_heigth, r=$outer_radius, center=true);
    if (!$plusterminal_drilling) {
        translate([0,0, $outer_heigth/2])
        cylinder(h=$plusterminal_pin_h, r=$plusterminal_pin_r, center=true);
    }
}
}
union() {
difference() {
  union() {
    cylinder(h=$inner_heigth, r=$inner_radius, center=true);
    translate([0, 4, 0]) cube([$outer_radius*2, $outer_radius*2, $inner_heigth], center=true);
//      translate([0, 4, 0]) resize(newsize=[$outer_radius*2, $outer_radius*2, $inner_heigth]) sphere(r=$inner_heigth/2);
  }
  translate([0, $strainrelief_height/2-$inner_radius, 0]) 
  strainrelief(h=$strainrelief_height, l=$strainrelief_length, t=$strainrelief_thickness);
}
if ($plusterminal_drilling) {
  translate([0, 0, $inner_heigth/2]) cylinder(h=$plusterminal_h, r=$plusterminal_r, center=false);
}
if ($minusterminal_drilling) {
  union() {
    translate([0, 0, -$inner_heigth/2-$minusterminal_h1]) cylinder(h=$minusterminal_h1, r=$minusterminal_r1, center=false);
    translate([0, 0, -$inner_heigth/2-$minusterminal_h2-$minusterminal_h1]) cylinder(h=$minusterminal_h2, r1=$minusterminal_r2, r2=$minusterminal_r1, center=false
  );
}

}
}

}

