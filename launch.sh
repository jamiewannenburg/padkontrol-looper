#!/bin/sh

# Copyright (C) 2017-2018 Vilniaus Blokas UAB, https://blokas.io/pisound
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

. /usr/local/pisound/scripts/common/start_puredata.sh
PATCH="/usr/local/patchbox-modules/imported/padkontrol/padkontrol-looper.pd"
shift

echof
echo "$PATCH"
echo "$@"

#(
	# Connect the osc2midi bridge to the MIDI Inputs and to Pure Data.
#	sleep 4
	# /usr/local/pisound-ctl/connect_osc2midi.sh "pisound-ctl"
#	aconnect "pisound-ctl" "Pure Data";
#	aconnect -d "Pure Data:1" "pisound-ctl"
#) &

start_puredata "$PATCH" $@