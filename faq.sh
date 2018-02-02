#!/usr/bin/env bash

faq=./`basename "$0"`
faqDir=../uoa-admin-tools

declare -A cmds

cmds["inst"]="inst"
cmds["dev up"]="npm run build:prod"
cmds["prod up"]="npm start"
cmds["back up"]="docker stack deploy -c docker-compose.yml faq_stack"
cmds["help"]="echo \"${!cmds[@]}\""

cmd=${cmds[$@]}

inst() {
    sudo apt-get install python2.7
    sudo apt-get install python-pip
    cd ${faqDir}
    git submodule update
    cd front-end
    npm install
}

$(${cmd})
