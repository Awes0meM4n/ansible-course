#!/bin/bash
# Install ntp package in test nodes
ansible -m yum -a "name=ntp state=present" -b test
# Obtain ntp.conf in test nodes
ansible -a "cat /etc/ntp.conf" test
# Obtain ntp.conf in test nodes
ansible -m systemd -a "name=ntpd state=started" -b test