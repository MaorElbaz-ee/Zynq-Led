# Zynq LED & Buttons – Arty Z7-20

First stage of a Zynq FPGA + Python project on the Digilent Arty Z7-20.

The Zynq PS is connected over AXI to an AXI GPIO block at 0x4120_0000:
channel 1 drives the 4 LEDs (offset 0x0) and channel 2 reads the 4 push
buttons (offset 0x8). The plan is to control them from Python with PYNQ.

The whole Vivado project is rebuilt from Tcl scripts, so only the scripts
are kept in the repo. Generated files (project, IP output, bitstream) are
ignored.

Status: builds to bitstream with timing met. Not yet tested on hardware.

## Requirements
- Vivado 2026.1
- Digilent board files for Arty Z7-20 (`digilentinc.com:arty-z7-20:part0:1.1`)

## Build
In the Vivado Tcl Console:

    cd <path-to-this-repo>
    source build.tcl

This creates the project in `./Zync_Led`, builds the block design,
generates the wrapper and runs synthesis, implementation and bitstream.
Takes about 5–6 minutes.

## Files
- `build.tcl` – full build flow
- `system_bd.tcl` – block design, exported with `write_bd_tcl`

## Next steps
1. LEDs and buttons from Python (PYNQ) on the board
2. Custom AXI-Lite IP
3. FIR filter with DMA
4. Testbenches with cocotb and pytest