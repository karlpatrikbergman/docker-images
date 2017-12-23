#!/bin/bash - 
#===============================================================================
#
#          FILE: get_installed_plugins.sh
# 
#         USAGE: ./get_installed_plugins.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 27/10/17 16:32
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

curl -s -k "http://admin:admin@localhost:8080/pluginManager/api/json?depth=1"  | jq -r '.plugins[].shortName' | tee plugins.txt

