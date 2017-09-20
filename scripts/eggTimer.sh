#!/bin/bash

#
# script for taking periodic breaks
#

limit=45
summary="The mind becomes better with movements"
endmessage="Take a break! Take a short stroll."
echo -n $limit

sleeper() {
    number=$1
    clock=60
    while [ $clock != 0 ]; do
        let "clock = $clock - 1"
        [ $((number%2)) -eq 0 ] && echo -n '.' || echo -n '*'
        sleep 1
    done
}

while true; do
    counter=0
    while [ $counter != $limit ]; do
        sleeper $counter
        let "counter = $counter + 1"

        print '\r%2d' $(($limit - $counter))
    done
    if [ $counter == $limit ]; then
        echo
        notify-send -u critical -i appointment "$summary" "$endmessage"
        echo -e '\a' >&2
        xdg-open http://www.youtube.com/watch?v=Hj0jzepk0WA
    fi
done



