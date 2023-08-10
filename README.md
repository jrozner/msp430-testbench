# msp430-testbench

msp430 testbench provides a skeleton for helping to develop msp430 disassemblers and decompilers. It provides everything needed to develop minimal firmware that can be run on a device and inspect the behavior of individual instructions or sets of instructions. It does this by creating an extern function `foo` that can be defined in assembly and allows an easy place to set a break point on to then step through these instructions. It's intended to be used on a real device with `mspdebug` to step through execution.

## Setup environment

1. Install dependencies. Specifically do not install `mspdebug` through the package manager because it is likely to be an old out of date version. Instead use the instructions in [mspdebug setup](mspdebug-setup.md).
```
sudo apt install binutils-msp430 gcc-msp430 gdb-msp430 msp430-libc msp430mcu
```

2. Clone repository
```
git clone git@github.com:jrozner/msp430-testbench.git
```

## Usage

The only file that should require modification is `inc.S` which defines a function `foo` that can be filled in with the assembly you'd like to test. You can use `make` to build the project which will produce an ELF as well as an IHEX file.

### Flashing

You can use `mspdebug` to flash the firmware onto the device using the `prog testbench.elf` command once it has connected to the device.

### Loading symbols

`mspdebug` won't automatically load symbols from an ELF and they are not present in the IHEX file to load. The `Makefile` will automatically generate a symbols file that can manually be loaded if desired using `sym import symbols`.

### Set a breakpoint

`mspdebug` doesn't resolve symbols for any of it's debugging or disassembly functionality so you'll need to identify the address of `foo`. You can do this one of two ways:
1. Load the symbols as mentioned above and use `sym find foo`
2. Use `msp430-readelf -s testbench.elf | grep foo`

You can use `setbreak <addr>` to set a breakpoint at the listed address.

### Debugging

For stepping, inspecting, and other debugging functionality you should reference the `mspdebug` documentation itself available using `man $HOME/mspdebug/share/man/man1/mspdebug.1`.
