#!/bin/sh /etc/rc.common
# Copyright (C) 2012 OpenWrt.org

# needs to start before the atm layer which starts at 50
START=48


DebugLevel=3

BIN_DIR=/opt/intel/bin

start() {

	if [ -r ${BIN_DIR}/dsl.cfg ]; then
		. ${BIN_DIR}/dsl.cfg 2> /dev/null
	fi

	if [ "$xDSL_Dbg_DebugLevel" != "" ]; then
		DebugLevel="${xDSL_Dbg_DebugLevel}"
	else
		if [ -e ${BIN_DIR}/debug_level.cfg ]; then
			# read in the global definition of the debug level
			. ${BIN_DIR}/debug_level.cfg 2> /dev/null

			if [ "$ENABLE_DEBUG_OUTPUT" != "" ]; then
				DebugLevel="${ENABLE_DEBUG_OUTPUT}"
			fi
		fi
	fi

	# Get environment variables for system related configuration
	if [ -r ${BIN_DIR}/dsl_auto.cfg ]; then
		. ${BIN_DIR}/dsl_auto.cfg 2> /dev/null
	fi

	# loading VDSL MEI Driver -
	cd ${BIN_DIR}
	${BIN_DIR}/inst_drv_mei_cpe.sh $DebugLevel

	if [ "$xDSL_Dbg_DebugLevel" != "" ]; then
	DebugLevel="${xDSL_Dbg_DebugLevel}"
	else
		if [ -e ${BIN_DIR}/debug_level.cfg ]; then
			# read in the global definition of the debug level
			. ${BIN_DIR}/debug_level.cfg 2> /dev/null
			if [ "$ENABLE_DEBUG_OUTPUT" != "" ]; then
				DebugLevel="${ENABLE_DEBUG_OUTPUT}"
			fi
		fi
	fi

	# loading DSL CPE API driver -
	cd ${BIN_DIR}
	${BIN_DIR}/inst_drv_dsl_cpe_api.sh $DebugLevel

	/opt/intel/etc/init.d/ltq_cpe_control_init.sh start

}

stop()
{
	/opt/intel/etc/init.d/ltq_cpe_control_init.sh stop

}
