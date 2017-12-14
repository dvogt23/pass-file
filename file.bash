#!/usr/bin/env bash
# pass file - Password Store Extension (https://www.passwordstore.org/)
# Copyright (C) 2017 Dimitrij Vogt <divogt@dima23.de>.
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#	gpg -o .passwordstore/test/test.txt.gpg -e -r divogt@live.de test.txt
#	gpg --output foo.txt --decrypt foo.txt.gpg

readonly VERSION="1.0"

cmd_file_version() {
	cat <<-_EOF
	$PROGRAM $COMMAND $VERSION - A pass extension that apply to add a file to passwordstore
	_EOF
}

cmd_file_usage() {
	cmd_file_version
	echo
	cat <<-_EOF
	Usage:
        $PROGRAM $COMMAND [-a <file> <pass item>] [-g <pass-name>] [-V] [-h]
            Provide a command to add files to passwordstore and
            get files back from passwordstore to the current location.

    	Options:
            a, add           Add file to passwordstore
            g, get           Get file from passwordstore
            -v, --version    Show version information.
            -h, --help       Print this help message and exit.

	More information may be found in the pass-file(1) man page.
	_EOF
}

# Insert data to the password store
# $1: Path in the password store
# $2: Filename
_insert() {
	local path="${1%/}" FILENAME="$2" passfile="$PREFIX/$path/$FILENAME.gpg"

	# echo "Path: $path"
	# echo "Filename: $FILENAME"
	# echo "Passfile: $passfile"
	mapfile < $FILENAME

	set_git "$passfile"
	mkdir -p -v "$PREFIX/$path"
	set_gpg_recipients "$path/$FILENAME"
	$GPG -e "${GPG_RECIPIENT_ARGS[@]}" -o "$passfile" "${GPG_OPTS[@]}" <<<"${MAPFILE[@]}" || \
	 	die "Error: File could not be stored."
	git_add_file "$passfile" "Insert file $path to store."
}

cmd_file_add() {
	# Sanity checks
	[[ -z "${*}" ]] && die "Usage: $PROGRAM $COMMAND [-a <file> <pass item>] [-g <pass-name>] [-V] [-h]"
	[[ ! -f $1 ]] && die "Error: File $1 must be exist."
	[[ -z "$2" ]] && die "Usage: $PROGRAM $COMMAND [-a <file> <pass item>] [-g <pass-name>] [-V] [-h]"

	local path="${2%/}"
	local passfile="$PREFIX/$path.gpg"
	local FILENAME="$1"
	local PASSPATH="$2"

	printf "\e[1m\e[37mAdd file $FILENAME to \e[4m%s\e[0m\n" "$path"

	_insert $path $FILENAME

	exit 0;
}

# Create file from pass
cmd_file_get() {
	# Sanity checks
	[[ -z "${*}" ]] && die "Usage: $PROGRAM $COMMAND [-a <file> <pass item>] [-g <pass-name>] [-V] [-h]"
	[[ ! -f $PREFIX/$1.gpg ]] && die "Error: File $1 must be exist."

	local path="$1"
	local passfile="$PREFIX/$path.gpg"
	local filename="$(basename $path)"
	[[ -f $passfile ]] && { $GPG -d "${GPG_OPTS[@]}" "$passfile" > $filename || exit $?; }
	exit 0;
}

# Getopt options
while true; do case $1 in
	a|add) shift; cmd_file_add "$@" ;;
	g|get) shift; cmd_file_get "$@" ;;
	-h|--help) shift; cmd_file_usage; exit 0 ;;
	-v|--version) shift; cmd_file_version; exit 0 ;;
	--) shift; break ;;
esac done

# General Start
[[ $err -ne 0 ]] && cmd_file_usage && exit 1
cmd_file "$@"