#!/bin/sh
VENDOR=toshiba
DEVICE=tostab03
VENDORDIR=../../../vendor/$VENDOR/$DEVICE
PROPDIR=$VENDORDIR/proprietary
THISDIR=$(pwd)


cd $PROPDIR
find . -type f | cut -c3- > $THISDIR/proprietary-files.txt
