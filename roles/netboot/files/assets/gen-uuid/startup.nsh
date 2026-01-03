echo -off
mode 80,25
cls
echo Do you want to randomize the SMBIOS UUID?
pause
AMIDEEFIx64.efi /SU auto
echo Done! Ready to reboot?
pause
reset

#https://gist.github.com/willglynn/b1204c593e96bdda5086597ee8a6db8d
