#!/bin/sh

# Copyright (C) 2017-2018 Vilniaus Blokas UAB, https://blokas.io/pisound
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

. /usr/local/pisound/scripts/common/start_puredata.sh
DIR=$(dirname "$0")
PATCH="$DIR/pd/padkontrol-looper.pd"

echo
echo "$PATCH"
echo "$@"

(
	# Connect the padkontrol to Pure Data.
	sleep 4
	# /usr/local/pisound-ctl/connect_osc2midi.sh "pisound-ctl"
	aconnect -x;
	aconnect "padKONTROL:1" "Pure Data:0"
	aconnect -d "Pure Data:1" "padKONTROL:1"
#	aconnect "pisound-ctl" "Pure Data";
#	aconnect -d "Pure Data:1" "pisound-ctl"
) &

start_puredata "$PATCH" $@