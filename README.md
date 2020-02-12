SSHI

Utility for ssh -i quick access

SETUP

1) Copy sshi.sh file into directory of your choice
2) Add the following lines into .bash_profile, .bashrc, or .profile of your home directory
	export SSHI_USERNAME=username_of_server
	export SSHI_KEY=path_to_your_ssh_key
	alias sshi=/path/to/sshi.sh
3) source .bash_profile (or .bashrc or .profile) or just close your terminal and open a new one

USAGE

sshi [hostname/url/alias] [environment]

EXAMPLES

sshi
	Will ssh into default path (match testing)

sshi match
	Will ssh into match testing server

sshi match prod
	Will ssh into match production server
