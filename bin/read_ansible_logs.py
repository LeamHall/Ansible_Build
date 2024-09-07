#!/usr/bin/env python

# name    :  read_ansible_logs.py
# version :  0.0.1
# date    :  20240907
# author  :  
# desc    :  


import json
import sys

if len(sys.argv) == 2:
    log_file = sys.argv[1]
else:
    print("Must have a log file to read.")
    sys.exit(1)

try:
    with open(log_file, "r") as log_in:
        log_data = json.load(log_in)
        print(log_data["stdout"])

except FileNotFoundError:
    print("File {} not found.".format(log_file))
    sys.exit(1)
except json.decoder.JSONDecodeError:
    print("Could not read JSON from file {}".format(log_file))
    sys.exit(1)
except KeyError:
    print("Could not find 'stdout' key in file {}.".format(log_file))
    sys.exit(1)
