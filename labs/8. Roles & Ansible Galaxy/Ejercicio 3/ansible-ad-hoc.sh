#!/bin/bash
ansible -m shell -a "systemctl status ntpd" -b all