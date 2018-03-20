$fn=64;

$outer_heigth=50;
$outer_radius=7;
$inner_radius=5;

$strainrelief_thickness=3;
$strainrelief_height=3;
$strainrelief_length=6;

$staerke_top=3;
$m_top=2.5;

$staerke1_bottom=3;
$staerke2_bottom=2;
$m1_bottom=2.5; // was 3
$m2_bottom=5.5; // was 5

$plusterminal_drilling=false;
$plusterminal_height=2;
$plusterminal_r=2.5;
$minusterminal_drilling=true;


$inner_heigth=$outer_heigth-$staerke_top-$staerke1_bottom-$staerke2_bottom;


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
translate([0, 0, $staerke_top-($staerke_top+$staerke1_bottom+$staerke2_bottom)/2]) {
    union() {
    cylinder(h=$outer_heigth, r=$outer_radius, center=true);
    if (!$plusterminal_drilling) {
        translate([0,0, $outer_heigth/2])
        cylinder(h=$plusterminal_height, r=$plusterminal_r, center=true);
    }
}
}
union() {
difference() {
  union() {
    cylinder(h=$inner_heigth, r=$inner_radius, center=true);
    translate([0, 4, 0]) cube([$outer_radius*2, $outer_radius*2, $inner_heigth], center=true);
  }
  translate([0, $strainrelief_height/2-$inner_radius, 0]) 
  strainrelief(h=$strainrelief_height, l=$strainrelief_length, t=$strainrelief_thickness);
}
if ($plusterminal_drilling) {
  translate([0, 0, $inner_heigth/2]) cylinder(h=$staerke_top, r=$m_top, center=false);
}
if ($minusterminal_drilling) {
  union() {
    translate([0, 0, -$inner_heigth/2-$staerke1_bottom]) cylinder(h=$staerke1_bottom, r=$m1_bottom, center=false);
    translate([0, 0, -$inner_heigth/2-$staerke2_bottom-$staerke1_bottom]) cylinder(h=$staerke2_bottom, r1=$m2_bottom, r2=$m1_bottom, center=false
  );
}

}
}

}
