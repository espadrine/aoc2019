#!/bin/bash
for d in `find * -type d`; do cd $d; make; cd ..; done
