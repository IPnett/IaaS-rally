#!/usr/bin/env python

import sys
import yaml

for filename in sys.argv[1:]:
    with open(filename, 'r') as stream:
        data = yaml.load(stream)
        print yaml.dump(data, default_flow_style=False)
