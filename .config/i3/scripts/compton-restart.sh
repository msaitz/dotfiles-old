#!/bin/bash

killall compton
sleep 4
compton --config $HOME/.config/compton
