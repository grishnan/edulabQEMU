# edulabQEMU
Virtual laboratory for educational purposes aimed at starting of typical virtualized network environments by means of QEMU




# Prerequisities:
QEMU version 4.1.0




# PreInstall:
1. cd to edulabQEMU
2. mkdir .machines; cd machines; mkdir 1 2 3 4 5 6 7 8 9 base hd
3. Directory "hd" must contain additional hard disk drives hd1.qcow2 and hd2.qcow2. Sizes of these drives are no object.
4. Directory "base" must contain original qcow2 virtual machines. For example, debian.qcow2, windows10.qcow2 etc.
5. Every numbered directory must contain hidden directory ".base" all of which contain symlinks SRV, CLI-C or CLI-P to the original virtual machines:

![dirs structure](https://user-images.githubusercontent.com/7554459/72189725-aaebfb80-340e-11ea-9774-6a4ed1585008.png)

Please note that files CLI-C.qcow2, CLI-P.qcow2, SRV.qcow2 are created automatically. These are snapshots of corresponding original VMs.





# Run laboratory:
1. cd to edulabQEMU
2. sudo ./run.sh

