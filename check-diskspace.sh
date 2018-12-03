#!/bin/sh
disk="$(df -h | grep /dev/xvda1 | awk {'print $5'} | cut -d'%' -f1)"
dt="$(date --iso-8601=seconds)"
echo $disk
if [ $disk -gt 70 ]; then
echo "Running out of space \" xvda1 ($disk%)\" on SERVER  as on $(date)"
curl -s --user 'api:key-XXXXXXX' https://api.mailgun.net/v3/mailgun.XXX/messages -F from='Server Alert <mailgun@mailgun.XXX>' -F to=MAIL -F subject='Server Disk Alert' -F text='Running out of space  xvda1 '$disk' % on SERVER  as on '$dt' '
fi
