# mspdebug Setup

## Installation

1. Install dependencies
```
sudo apt install libusb-dev libusb-0.1-4
```

2. Clone repository
```
git clone git@github.com:dlbeer/mspdebug.git
```

3. Build the software
```
cd mspdebug && PREFIX=$HOME/mspdebug make && PREFIX=$HOME/mspdebug make install
```

4. Install tilib. This can be obtained from [here](https://www.ti.com/tool/MSPDS).  You can download the open source package and build the library yourself or choose the developers package and use a pre-built version of the library. This can be placed anywhere but for ease of use just place it at `$HOME/mspdebug/lib/mspdebug/libmsp430.so`

## Running

Because we're not installing this into `/usr` and into our normal path we need to to jump through a few steps to execute. 

```
LD_PRELOAD=$HOME/mspdebug/lib/mspdebug/libmsp430.so $HOME/mspdebug/bin/mspdebug tilib
```

Depending on whether the firmware is out date on the device you may need to launch with the `--allow-fw-update` flag. An error message should inform you of this if so.
