#!/bin/bash
if [ ! -f /var/run/reboot-required ]; then
        echo "No reboot required"
        exit 0
else
        echo "WARNING: `cat /var/run/reboot-required`"
	curl -s --user 'api:key-XXXXXXX' https://api.mailgun.net/v3/mailgun.XXX/messages -F from='Server Alert <mailgun@mailgun.XXX>' -F to=MAIL -F subject='Server Reboot alert' -F text='Server needs to be restarted'
        exit 1
fi
