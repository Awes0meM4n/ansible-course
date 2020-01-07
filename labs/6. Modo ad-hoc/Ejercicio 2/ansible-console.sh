#!/bin/bash
# Launch ansible-console in test nodes
ansible-console -b test
# Obtain ntp.conf in test nodes
cat /etc/ntp.conf
# Obtain ntp.conf in test nodes
systemd name=ntpd state=started