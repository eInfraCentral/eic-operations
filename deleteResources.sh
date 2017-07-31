#!/usr/bin/env bash
psql -hlocalhost -Uvrasidas registry -c 'drop owned by vrasidas cascade;'
