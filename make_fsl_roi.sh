#!/bin/bash

#make the script to fail if any of the commands ran fails.
set -e

## create front half of white matter mask
SIZE=`fslinfo aparc+aseg_anat.nii.gz | grep ^dim2 | awk {'print $2'}`
fslmaths aparc+aseg_anat.nii.gz -bin -roi 0 -1 $(($SIZE/2)) -1 0 -1 0 -1 wm_fh

touch wmmask.success
