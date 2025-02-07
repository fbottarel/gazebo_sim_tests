#!/bin/bash

set -e

xacro -o bounce_test.world xacro/bounce_test.xacro
gz sim bounce_test.world