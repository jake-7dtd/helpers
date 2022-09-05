#!/bin/bash
#Copy the file to a directory containing a generated world and launch. Linux or Cygwin only, this does not run under Windows!
awk '{ print $4" "$6 }' FS=\" prefabs.xml > prefabLoc.lst
awk '{ print $4 }' FS=\" prefabs.xml > prefab.lst
sort prefab.lst | uniq -c > prefab.num
sort --reverse prefab.num > prefab.sorted
grep part_ prefab.sorted > prefab.parts-only.sorted
grep -v part_ prefab.sorted > prefab.no-parts.sorted
grep -v rwg_tile prefab.no-parts.sorted > prefab.no-parts.no-tiles.sorted
grep rwg_tile prefab.no-parts.sorted > prefab.tiles-only.sorted
