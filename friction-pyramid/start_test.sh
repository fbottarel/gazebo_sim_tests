#!/bin/bash

set -e

erb erb/friction_pyramid_test.world.erb > friction_pyramid.world
gz sim -v 4 friction_pyramid.world