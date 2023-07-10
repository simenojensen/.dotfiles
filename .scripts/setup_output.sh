#!/usr/bin/env bash

echo "Enter Vessel Name file: (e.g. morning-pilot)"
read VESSEL_NAME

OUTPUT_FILE_NAME=$VESSEL_NAME"-setup-output.txt"
OUTPUT_PDF_NAME=$VESSEL_NAME"-setup-output.pdf"

echo "Enter user@machine:"
read SSH_LOGIN
echo "Enter sudo password:"
read -s SSH_PASSWORD

echo "Enter ssh password:"

ssh -t $SSH_LOGIN bash -c "'

echo " "
echo "ipconfig"
echo "-------------------------------------------------------------"
ifconfig

echo " "
echo "cat /etc/NetworkManager/system-connections/WAN.nmconnection"
echo "-------------------------------------------------------------"
echo $SSH_PASSWORD | sudo -S cat /etc/NetworkManager/system-connections/WAN.nmconnection

echo " "
echo "cat /etc/NetworkManager/system-connections/Local.nmconnection"
echo "-------------------------------------------------------------"
echo $SSH_PASSWORD | sudo -S cat /etc/NetworkManager/system-connections/Local.nmconnection

echo " "
echo "sudo swupd update"
echo "-------------------------------------------------------------"
echo $SSH_PASSWORD | sudo -S swupd update

echo " "
echo "sudo dolittle-edge-agent --system-information"
echo "-------------------------------------------------------------"
echo $SSH_PASSWORD | sudo -S dolittle-edge-agent --system-information

echo " "
echo "systemctl status openvpn-client@dolittle-edge.service"
echo "-------------------------------------------------------------"
systemctl status -l --no-pager openvpn-client@dolittle-edge.service

echo " "
echo "systemctl status iotedge.service"
echo "-------------------------------------------------------------"
systemctl status -l --no-pager iotedge.service

echo " "
echo "ls -l /etc/dolittle.timeseries/"
echo "-------------------------------------------------------------"
ls -l /etc/dolittle.timeseries/

echo " "
echo "ls -l /etc/iotedge/"
echo "-------------------------------------------------------------"
ls -l /etc/iotedge/
'" > $OUTPUT_FILE_NAME


