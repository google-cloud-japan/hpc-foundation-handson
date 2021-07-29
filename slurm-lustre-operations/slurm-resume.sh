#!/bin/bash

# Copyright 2021 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -eu

cmdname=$( basename "$0" )

usage() {
  echo "Usage: ${cmdname} [-c config]" 1>&2
  echo "  -c : config file (default: slurm-01.yaml)" 1>&2
  exit 1
}

config="slurm-01.yaml"

while getopts c:h opt
do
  case $opt in
    "c" ) config="${OPTARG}" ;;
    "h" ) usage ;;
      * ) usage ;;
  esac
done

if [ ! -e "${config}" ]; then
  echo "Config file (${config}) is not found." 1>&2
  usage
fi

trimmed_config=$(sed -e 's| ||g' "${config}")
cluster=$(echo "${trimmed_config}" | grep cluster_name | sed -e 's|cluster_name:||g')
if [ "${cluster}" = "" ]; then
  echo "The cluster name is invalid."
  usage
fi
zone=$(echo "${trimmed_config}" | grep -m 1 zone | sed -e 's|zone:||g')
if [ "${zone}" = "" ]; then
  echo "The zone is invalid."
  usage
fi

mgmt=$( gcloud deployment-manager deployments describe "${cluster}" --format json \
    | jq -r '.resources[]|select(.type=="compute.v1.instance")|.name' \
    | grep -v image)
for id in ${mgmt}; do
    gcloud beta compute instances resume "${id}" --zone "${zone}"
done
