#!/bin/bash  
main () {
    if [[ $# -eq 0 ]];
    then  
        echo "one for you, one for me"
    else
        echo "one for $1, one for me"
    fi
}
 
main "$@"
