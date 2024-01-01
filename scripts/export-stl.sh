#! /usr/bin/env sh

[ -d target ] || mkdir target

openscad -D '$outer_heigth=50.0' -D '$outer_radius=13' -D '$plusterminal_drilling=true'  -D '$minusterminal_drilling=true'  -o target/battery_dummy-c-pm.stl battery_dummy.scad
openscad -D '$outer_heigth=50.0' -D '$outer_radius=13' -D '$plusterminal_drilling=true'  -D '$minusterminal_drilling=false' -o target/battery_dummy-c-p.stl battery_dummy.scad
openscad -D '$outer_heigth=50.0' -D '$outer_radius=13' -D '$plusterminal_drilling=false' -D '$minusterminal_drilling=true'  -o target/battery_dummy-c-m.stl battery_dummy.scad

openscad -D '$outer_heigth=49.5' -D '$outer_radius=7' -D '$plusterminal_drilling=true'  -D '$minusterminal_drilling=true'  -o target/battery_dummy-aa-pm.stl battery_dummy.scad
openscad -D '$outer_heigth=49.5' -D '$outer_radius=7' -D '$plusterminal_drilling=true'  -D '$minusterminal_drilling=false' -o target/battery_dummy-aa-p.stl battery_dummy.scad
openscad -D '$outer_heigth=49.5' -D '$outer_radius=7' -D '$plusterminal_drilling=false' -D '$minusterminal_drilling=true'  -o target/battery_dummy-aa-m.stl battery_dummy.scad

openscad -D '$outer_heigth=44.2' -D '$outer_radius=5' -D '$plusterminal_drilling=true'  -D '$minusterminal_drilling=true'  -o target/battery_dummy-aaa-pm.stl battery_dummy.scad
openscad -D '$outer_heigth=44.2' -D '$outer_radius=5' -D '$plusterminal_drilling=true'  -D '$minusterminal_drilling=false' -o target/battery_dummy-aaa-p.stl battery_dummy.scad
openscad -D '$outer_heigth=44.2' -D '$outer_radius=5' -D '$plusterminal_drilling=false' -D '$minusterminal_drilling=true'  -o target/battery_dummy-aaa-m.stl battery_dummy.scad

