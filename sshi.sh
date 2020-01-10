#!/bin/bash
# Author: Devin Haynes

#defaults
pk=$SSHI_KEY
username=$SSHI_USERNAME
uri=""
#Set Default URI for quick access
defaultUri="match.testing.edipdev.io"
app=""
invalid="false"
errorMsg=""

#Check for options
if [ $# -eq 0 ]
#No options. Use default URI
then
	uri=$defaultUri
# 1 option used - Change app
elif [ $# -eq 1 ]
then
	#if bids, change uri to bids testing
	if [[ $1 == 'bids' ]]
	then
		app=$1
		uri='bids.testing.edipdev.io'
	elif [[ $1 == 'match' || $1 == 'sbna' ]]
	then
		uri=$defaultUri
		app=$1
	else
		app=$1
		invalid="true"
		errorMsg="${1} is not a valid option"
	fi
# 2 options used - Change uri
elif [ $# -eq 2 ]
then
	app=$1
	if [[ $2 == 'prod' ]]
	then
		if [[ $app == 'sbna' || $app == 'match' ]]
		then
			uri="match.state.gov"
		elif [[ $app == 'bids' ]]
		then
			uri="bids.state.gov"
		else
			app=$1
			invalid="true"
			errorMsg="${1} is not a valid option"
		fi
	elif [[ $2 == 'testing' ]]
	then
		if [[ $app == 'sbna' || $app == 'match' ]]
		then
			uri="match.testing.edipdev.io"
		elif [[ $app == 'bids' ]]
		then
			uri="bids.testing.edipdev.io"
		else
			app=$1
			invalid="true"
			errorMsg="${1} is not a valid option"
		fi
	elif [[ $2 == 'staging' ]]
	then
		if [[ $app == 'sbna' || $app == 'match' ]]
                then
                        uri="match.staging.edipdev.io"
                elif [[ $app == 'bids' ]]
                then
                        uri="bids.staging.edipdev.io"
                else
                        app=$1
                        invalid="true"
			errorMsg="${1} is not a valid option"
                fi
	else
		invalid="true"
		errorMsg="${2} is not valid"
	fi
else
	invalid="true"
fi

if [[ $invalid == 'false' ]]
then
	echo -e "Connecting to $uri..."
	ssh -i $pk $username@$uri
else
	echo -e "Unable to process request"
	echo -e $errorMsg
fi
