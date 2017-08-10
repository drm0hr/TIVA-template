PART=TM4C123GH6PM

ROOT=/Users/chris/ti/tirex-content/TivaWare_C_Series-2.1.3.156

include ${ROOT}/makedefs

VPATH=src
# VPATH+=${ROOT}/examples/boards/ek-tm4c123gxl/drivers

IPATH=${ROOT}
# IPATH+=${ROOT}/examples/boards/ek-tm4c123gxl


all: ${COMPILER}
all: ${COMPILER}/main.axf

clean:
	@rm -rf ${COMPILER} ${wildcard *~}

${COMPILER}:
	@mkdir -p ${COMPILER}

${COMPILER}/main.axf: ${COMPILER}/main.o
${COMPILER}/main.axf: ${COMPILER}/startup_${COMPILER}.o
${COMPILER}/main.axf: ${ROOT}/driverlib/${COMPILER}/libdriver.a
${COMPILER}/main.axf: tm4c123gh6pm.ld

SCATTERgcc_main=tm4c123gh6pm.ld
ENTRY_main=ResetISR
CFLAGSgcc=-DTARGET_IS_TM4C123_RB1

ifneq (${MAKECMDGOALS},clean)
-include ${wildcard ${COMPILER}/*.d} __dummy__
endif
