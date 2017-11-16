#!/usr/bin/env bash

./pull.sh
./npmi.sh &
./up_prod.sh &
./mcip.sh
./delData.sh
./back_down.sh
./back.sh
./addData.sh
./back_down.sh
./back.sh
