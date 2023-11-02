#!/bin/bash

aerolab cluster stop -n six
aerolab cluster stop -n seven
aerolab client stop -n ams-test
aerolab cluster destroy -n six
aerolab cluster destroy -n seven
aerolab client destroy -n ams-test


