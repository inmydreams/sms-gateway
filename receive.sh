#!/bin/sh

RESPONSE=`curl -s -X GET http://192.168.8.1/api/webserver/SesTokInfo`
COOKIE=`echo "$RESPONSE"| grep SessionID=| cut -b 10-147`
TOKEN=`echo "$RESPONSE"| grep TokInfo| cut -b 10-41`
DATA="<request><PageIndex>1</PageIndex><ReadCount>3</ReadCount><BoxType>1</BoxType><SortType>0</SortType><Ascending>0</Ascending><UnreadPreferred>1</UnreadPreferred></request>"

curl -b $COOKIE -c $COOKIE -H "X-Requested-With: XMLHttpRequest" --data "$DATA" http://192.168.8.1/api/sms/sms-list --header "__RequestVerificationToken: $TOKEN" --header "Content-Type:text/xml"