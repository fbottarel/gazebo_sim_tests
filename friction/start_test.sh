#!/bin/bash

set -e

xacro -o friction_test.world xacro/friction_test.xacro
gz sim -v 4 friction_test.world