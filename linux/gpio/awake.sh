#!/bin/bash

echo 16 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio16/direction
echo 0 > /sys/class/gpio/gpio16/value
