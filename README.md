# edulabQEMU
Virtual laboratory for educational purposes aimed at starting of typical virtualized network environments by means of QEMU

# Prerequisities:
QEMU version 4.1.0

# PreInstall:
1. cd to edulabQEMU
2. mkdir machines; cd machines; mkdir 1 2 3 4 5 6 base; cd base
3. Create linux.qcow2, windows.qcow2, windows_server.qcow2 virtual machines. These are base VMs.
4. Now you can place snapshots of the base VMs in dirs machines/1, machines/2, etc. Snapshots names in the machines/n must according to n configuration scheme (look at function print_scheme from run.sh)

# Run laboratory:
1. cd to edulabQEMU
2. chmod +x qemu-ifup qemu-ifdown startlab run.sh
3. sudo ./run.sh
