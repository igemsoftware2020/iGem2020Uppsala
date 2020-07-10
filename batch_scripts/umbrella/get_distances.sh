#!/bin/bash

#################################################
# get_distances.sh
#
#   Script iteratively calls gmx distance and
#   assembles a series of COM distance values
#   indexed by frame number, for use in
#   preparing umbrella sampling windows.
#
# Written by: Justin A. Lemkul, Ph.D.
#    Contact: jalemkul@vt.edu
#
#################################################
ml gromacs

echo 0 | gmx trjconv -s pull2.tpr -f pull2.xtc -o conf.gro -sep

# compute distances
for (( i=2; i<2999; i++ ))
do
  gmx distance -s pull2.tpr -f conf${i}.gro -n index.ndx -select "com of group 19 plus com of group 20" -oall dist${i}.xvg
done

# compile summary
touch summary_distances.dat
for (( i=0; i<3000; i++ ))
do
    d=`tail -n 1 dist${i}.xvg | awk '{print $2}'`
    echo "${i} ${d}" >> summary_distances.dat
    rm dist${i}.xvg
done

exit;
