#!/bin/bash

create_log_entry() {
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    country="iran"
    city="tehran"
    population=$((RANDOM * RANDOM))
    randomshortint=$((1 + RANDOM % 100))
    men=$(($population / 2))
    women=$(($population / $randomshortint))
    hOffset=$(($population * 2))
    vOffset=100
    weather="sun1.city=(sun1.city / 100) * 90;"
    json='{"country":'$country', "city": '$city', "population": '$population', "men": '$men', "women": '$women', "hOffset": '$hOffset', "vOffset": '$vOffset', "weather": '$weather'}'
    log="myfirsylog : $timestamp hello devops:\n$json"
    echo -e "$log"
}

while true; do
    log_record=$(create_log_entry)
    # echo "${log_record}" | nc localhost 8080
    echo "${log_record}" | logger -t "myscript" -p local0.info  # Send to syslog with tag "myscript" and priority "local0.info"
    sleep 3
done

