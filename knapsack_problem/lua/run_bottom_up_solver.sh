#! /usr/bin/env bash

eval $(luarocks path)
{ time lua ./bottom_up_solver.lua ../data/data4_2.json; } &> output.txt
cat output.txt
