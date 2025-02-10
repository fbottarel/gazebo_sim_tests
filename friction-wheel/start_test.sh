#!/bin/bash

set -e

xacro -o friction_wheel_test.world xacro/friction_wheel_test.xacro
gz sim -v 4 friction_wheel_test.world