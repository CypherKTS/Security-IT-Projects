# BASH Port Scanner

## Overview

This repository contains a simple Bash-based TCP port scanner. The script scans specified TCP ports on a given host to determine which ports are open or closed. It checks if the host is alive using a ping test and then scans the provided range of ports. The script can be run in interactive mode or batch mode for scanning multiple hosts.

### Author
**Uzair Khan**  
B.S. Cybersecurity, minor in Computer Science

### Date
February 15, 2026

---

## Features
- **Host Check**: Verifies whether the target host is online using ICMP ping.
- **Port Scanning**: Scans a given range of ports on the host to check if each port is open or closed.
- **Interactive Mode**: If no hostname is specified, the script will prompt you for a hostname and port range.
- **Batch Mode**: Accepts input from a file to scan multiple hosts and port ranges sequentially.

---

## Usage

### Running the Script

To run the port scanner, use the following command:

```bash
./portscanner.sh [-t timeout] [host startport stopport]
