#!/bin/bash
echo -n "Enter Modulename: "
read MODULE
iverilog $MODULE.v
yosys -p "read_verilog $MODULE.v; hierarchy -check; proc; opt; write_json $MODULE.json"
netlistsvg $MODULE.json -o $MODULE"_RTL.html" --background white --stroke-width 5
rm -r $MODULE.json a.out
DESIGN=$MODULE"_RTL.html"
chmod +x $DESIGN
xdg-open $DESIGN
clear