#! /usr/bin/env sh

openscad -D '$type="AA"'  -D '$plusterminal_drilling=true'  -D '$minusterminal_drilling=true'  -o battery_dummy-aa-pm.stl battery_dummy.scad
openscad -D '$type="AA"'  -D '$plusterminal_drilling=true'  -D '$minusterminal_drilling=false' -o battery_dummy-aa-p.stl battery_dummy.scad
openscad -D '$type="AA"'  -D '$plusterminal_drilling=false' -D '$minusterminal_drilling=true'  -o battery_dummy-aa-m.stl battery_dummy.scad
openscad -D '$type="AAA"' -D '$plusterminal_drilling=true'  -D '$minusterminal_drilling=true'  -o battery_dummy-aaa-pm.stl battery_dummy.scad
openscad -D '$type="AAA"' -D '$plusterminal_drilling=true'  -D '$minusterminal_drilling=false' -o battery_dummy-aaa-p.stl battery_dummy.scad
openscad -D '$type="AAA"' -D '$plusterminal_drilling=false' -D '$minusterminal_drilling=true'  -o battery_dummy-aaa-m.stl battery_dummy.scad
