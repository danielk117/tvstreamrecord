#!/bin/sh

# exit or kill handler
kill_child_processes() {
    isTopmost=$1
    curPid=$2
    childPids=`ps -o pid --no-headers --ppid ${curPid}`

    for childPid in $childPids
    do
        printf "kill child $childPid<br>"
        kill_child_processes 0 $childPid
    done

    if [ $isTopmost -eq 0 ]; then
        printf "kill parent $curPid<br>"
        kill -9 $curPid 2> /dev/null
    fi

    if [ ! -z "$deletefile" ] && [ -f $deletefile ]; then
        printf "delete $deletefile<br>"
        rm -- "$deletefile"
    fi
}
trap "kill_child_processes 1 $$; exit 0" 0


# create virtual interfaces
vrtip=$(ifconfig | awk -F"[: ]+" '/vrt/{getline;  {print $4}}')
if [ -z "$vrtip" ]; then
    printf "no vrt interfaces found<br>"
    for i in "0" "1" "2" "3"; do
        printf "create vrt$i<br>"
        ip link add link eth1 address 00:11:22:33:44:"$i$i" vrt"$i" type macvlan
        /usr/sbin/dhclient -4 -nw -lf /tmp/dhcpv4.leases.vrt"$i" -pf /tmp/dhcpcd-vrt"$i".pid -sf /var/run/dhclient-script vrt"$i"
    done
    sleep 10
    vrtip=$(ifconfig | awk -F"[: ]+" '/vrt/{getline;  {print $4}}')
fi
printf "vrtip: $vrtip<br>"


# find free ip and try to record
for i in $vrtip; do
  runningfile="/volume1/@appstore/tvstreamrecord/running_$i.run"
  if [ -f $runningfile ]; then
    printf "$runningfile exists<br>"
  else
    printf "$runningfile not exists<br>"
    echo "running now" >> $runningfile

    printf "using bind adress $i<br>"
    deletefile="$runningfile"
    BIND_ADDR="$i" LD_PRELOAD=/usr/lib/bind.so /volume1/\@appstore/ffmpeg/bin/ffmpeg "$@"
    rm -- "$runningfile"
    unset deletefile

    break
  fi
done
