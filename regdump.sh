#!/usr/bin/env bash

pg_dump -h localhost -Uvrasidas registry -f /home/pgl/eic/eic-data/backups/$(date "+%Y.%m.%d-%H.%M.%S").db
