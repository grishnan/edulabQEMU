# edulabQEMU
Virtual laboratory for educational purposes aimed at starting of typical virtualized network environments by means of QEMU

# Prerequisities:
QEMU version 4.1.0

# PreInstall:
1. cd to edulabQEMU
2. mkdir machines; cd machines; mkdir 1 2 3 4 5 6 base
3. Directory "base" must contain original qcow2 virtual machines. For example, debian.qcow2, windows10.qcow2 etc.
4. Every numbered directory must contain hidden directory ".base" all of which contain symlinks SRV, CLI-C or CLI-P to the original virtual machines:

machines/
├── 1
│   ├── .base
│   │   ├── CLI-C -> ../../base/debian.qcow2
│   │   ├── CLI-P -> ../../base/debian.qcow2
│   │   └── SRV -> ../../base/debian.qcow2
│   ├── CLI-C.qcow2
│   ├── CLI-P.qcow2
│   └── SRV.qcow2
└── base
    ├── debian.qcow2
    ├── windows10.qcow2
    ├── windows_server2019_noGUI.qcow2
    └── windows_server2019.qcow2

Please note that files CLI-C.qcow2, CLI-P.qcow2, SRV.qcow2 are created automatically. These are snapshots of corresponding original VMs.

# Run laboratory:
1. cd to edulabQEMU
2. chmod +x qemu-ifup qemu-ifdown startlab run.sh
3. sudo ./run.sh

# TODO:
1. automate snapshots creation
