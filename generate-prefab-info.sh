#!/bin/bash
#Copy the file to a directory containing a generated world and launch. Linux or Cygwin only, this does not run under Windows!
awk '{print $4" "$6}' FS=\" prefabs.xml | grep -v "^UTF-8 $" | awk 'NF' | awk '$1=$1' > prefabs.loc.lst
awk '{print $4}' FS=\" prefabs.xml | grep -v "^UTF-8$" | awk 'NF' | awk '$1=$1' > prefabs.lst
sort prefabs.lst | uniq -c > prefabs.num
sort --reverse prefabs.num > prefabs.sorted
rm prefabs.num prefabs.lst
grep part_ prefabs.sorted > prefabs.parts-only.sorted
grep -v part_ prefabs.sorted > prefabs.no-parts.sorted
grep rwg_tile prefabs.no-parts.sorted > prefabs.tiles-only.sorted
grep -v rwg_tile prefabs.no-parts.sorted > prefabs.no-parts.no-tiles.sorted