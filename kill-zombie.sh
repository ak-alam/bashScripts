##################################################
##################################################
# Write a shell script function to find and  
#kill all the zombie processes.             
##################################################
##################################################

#!/bin/bash

kill_zombie_process(){
   echo "All Zombie Processes."
   echo $(ps aux | egrep "Z|defunct")
   echo ##############################
   parent_proc_id=$(ps axo ppid,stat | grep Z | awk '{print $1}')
   echo "Parent process ID: $parent_proc_id"
   echo "Killing Zombie Process $parent_proc_id"
   kill -9 $parent_proc_id
}
kill_zombie_process