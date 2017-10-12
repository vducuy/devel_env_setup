# Let make use multiple cores to speed up compiles
       makeflags = -j 32
# This is a sample config file. It was tested with:
#
#      Compiler name/version:       [Toolchain, 9.0.7-le]
#      Operating system version:    [Ubuntu/Centos]
#      Hardware:                    [APM Board]
#
# If your platform uses different versions, different
# hardware or operates in a different mode (for
# example, 32- vs. 64-bit mode), there is the possibiliy
# that this configuration file may not work as-is.
#
# Note that issues with compilation should be directed
# to the compiler vendor. Information about SPEC techncial
# support can be found in the techsupport document in the
# Docs directory of your benchmark installation.
#
# Also note that this is a sample configuration. It
# is expected to work for the environment in which
# it was tested; it is not guaranteed that this is
# the config file that will provide the best performance.
#
# Note that you might find a more recent config file for
# your platform with the posted results at
# www.spec.org/cpu2006
strict_rundir_verify = 0
#####################################################################
VERSION = 9.0.7
tune          = peak
ext           = linux_arm64_le_peak
output_format = all
reportable    = 0
teeout        = yes
flagsurl      = $[top]/config/flags/APM_arm64_toolchain.xml

default=default=default=default:
#####################################################################
#
# Compiler selection
#
#####################################################################

APM_TOOLCHAIN_PATH=/opt/apm/9.0.7-le
SPECINT_PATH=/opt/specint12

CC           = ${APM_TOOLCHAIN_PATH}/usr/bin/gcc 
CXX          = ${APM_TOOLCHAIN_PATH}/usr/bin/g++
FC           = ${APM_TOOLCHAIN_PATH}/usr/bin/gfortran

## Admin config
license_num  = 0
test_sponsor = Turbo Computers
tester       =
prepared_by  =

## HW config
hw_avail           = Dec-2010
hw_model           = amcc
hw_cpu_name        = XGene
hw_cpu_char        =
hw_cpu_mhz         = 3000
hw_fpu             = Integrated
hw_nchips	   = 1
hw_ncores	   = 32
hw_ncoresperchip   = 32
hw_nthreadspercore = 1
hw_ncpuorder       = 1 chip
hw_pcache          = 64 KB I + 64 KB D on chip per chip
hw_scache          = 1 MB I+D on chip per chip
hw_tcache          = None
hw_ocache          = None
hw_memory          = 256 GB (8 x 32GB DDR2400)
hw_disk            = SATA
hw_vendor          = APM

## SW config
sw_os           = Linux 4.5.0-27.el7.170915+apm.ilp32.aarch64
sw_file         = xfs
sw_state        = runlevel 3
sw_compiler     = gcc , g++ & gfortran 6.0.0
sw_avail        = Dec-9999
sw_other        = None
sw_base_ptrsize = 64-bit
sw_peak_ptrsize = Not Applicable


################################################################
# Peak Tuning Flags int 
################################################################

int=peak=default:
COPTIMIZE     = -Ofast
CXXOPTIMIZE   = -Ofast
EXTRA_LDFLAGS =  -static
EXTRA_LDFLAGS_ILP32 = -static -L${SPECINT_PATH}/libilp32
EXTRA_LDFLAGS_LP64 = -static -L${SPECINT_PATH}/lib64
# TO RUN: PREPEND HUGETLB_ELFMAP=RW HUGETLB_MORECORE=yes 
PASS1_CFLAGS   = -fprofile-generate
PASS2_CFLAGS   = -fprofile-use -flto=32
PASS1_CXXFLAGS = -fprofile-generate
PASS2_CXXFLAGS = -fprofile-use -flto=32
PASS1_LDFLAGS  = -fprofile-generate
PASS2_LDFLAGS  = -fprofile-use -flto=32

# Link section
CLD          = ${APM_TOOLCHAIN_PATH}/usr/bin/gcc -fwhole-program
CXXLD        = ${APM_TOOLCHAIN_PATH}/usr/bin/g++ -fwhole-program
FLD          = ${APM_TOOLCHAIN_PATH}/usr/bin/gfortran -fwhole-program

400.perlbench=peak=default:
COPTIMIZE     = -Ofast -mabi=ilp32 -mcpu=xgene1 -mtune=cortex-a57 --std=gnu89 -fsigned-char -finline-small-functions -fno-strict-aliasing
CPORTABILITY   = -DSPEC_CPU_LINUX 
EXTRA_LIBS     = -lsmartheap -lpthread 
EXTRA_LDFLAGS =  -Wl,--allow-multiple-definition ${EXTRA_LDFLAGS_ILP32}

401.bzip2=peak=default:
COPTIMIZE     = -Ofast -mabi=ilp32 -mcpu=xgene1 -mtune=cortex-a57 -funroll-all-loops -funcse
EXTRA_LIBS     = -lsmartheap -lpthread 
EXTRA_LDFLAGS =  -Wl,--allow-multiple-definition ${EXTRA_LDFLAGS_ILP32}

403.gcc=peak=default:
COPTIMIZE     = -Ofast -mabi=ilp32 -mcpu=xgene1 -mtune=cortex-a57 -fno-reorder-blocks -fno-reorder-blocks-and-partition
EXTRA_LIBS     = -lsmartheap -lpthread 
EXTRA_LDFLAGS =  -Wl,--allow-multiple-definition ${EXTRA_LDFLAGS_ILP32}

429.mcf=peak=default:
COPTIMIZE     = -Ofast -mabi=ilp32 -mcpu=xgene1 -mtune=cortex-a57 -fprefetch-loop-arrays
EXTRA_LIBS     = -lsmartheap -lpthread 
EXTRA_LDFLAGS =  -Wl,--allow-multiple-definition ${EXTRA_LDFLAGS_ILP32}

445.gobmk=peak=default:
COPTIMIZE     = -Ofast -fprefetch-loop-arrays
PORTABILITY   = -DSPEC_CPU_LP64

456.hmmer=peak=default:
COPTIMIZE     = -Ofast -fnoalias=P7Viterbi --param max-unrolled-insns=100000 -funroll-all-loops 
PORTABILITY   = -DSPEC_CPU_LP64

458.sjeng=peak=default:
COPTIMIZE     = -Ofast -funcse
PORTABILITY   = -DSPEC_CPU_LP64

462.libquantum=peak=default:
COPTIMIZE     = -Ofast -funroll-all-loops
# -ftree-parallelize-loops=8
PORTABILITY   = -DSPEC_CPU_LP64
CPORTABILITY  = -DSPEC_CPU_LINUX

464.h264ref=peak=default:
COPTIMIZE     = -Ofast -mabi=ilp32 -mcpu=xgene1 -mtune=cortex-a57  -fsigned-char   -fno-ree -fno-aggressive-loop-optimizations -funcse
EXTRA_LDFLAGS =  ${EXTRA_LDFLAGS_ILP32}

471.omnetpp=peak=default:
CXXOPTIMIZE   = -Ofast -mabi=ilp32 -mcpu=xgene1 -mtune=cortex-a57 -fprefetch-loop-arrays # -pthread --param prefetch-latency=150 --param prefetch-min-insn-to-mem-ratio=0
EXTRA_LDFLAGS = -Wl,--allow-multiple-definition ${EXTRA_LDFLAGS_ILP32} 
EXTRA_LIBS    = -lsmartheapC -lsmartheap -lpthread 

473.astar=peak=default:
CXXOPTIMIZE   = -Ofast -mabi=ilp32 -mcpu=xgene1 -mtune=cortex-a57  -fprefetch-loop-arrays # -pthread
EXTRA_LDFLAGS = -Wl,--allow-multiple-definition ${EXTRA_LDFLAGS_ILP32} 
EXTRA_LIBS = -lsmartheap -lsmartheapC -lpthread

483.xalancbmk=peak=default:
CXXOPTIMIZE   = -Ofast -mabi=ilp32 -mcpu=xgene1 -mtune=cortex-a57 -fprefetch-loop-arrays -funcse
CXXPORTABILITY = -DSPEC_CPU_LINUX
EXTRA_LDFLAGS  = -Wl,--allow-multiple-definition ${EXTRA_LDFLAGS_ILP32} 
EXTRA_LIBS     = -lsmartheapC -lsmartheap -lpthread 

