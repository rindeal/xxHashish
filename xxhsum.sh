#!/bin/sh

set -u  # nounset
set -e  # errexit
set -f  # noglob
set -C  # noclobber

if expr "${#}" "<" "1" >/dev/null
then
	>&2 printf "Error: no file(s) specified\n"
	exit 1
fi

# get the hashes
. "$(dirname "${0}")/xxhashi.sh"

exit_status=0

for file in "${@}"
do
	if ! test -f "${file}"
	then
		>&2 printf "Error: not a file - '${file}'\n"
		exit_status=1
		continue
	fi
	if ! test -r "${file}"
	then
		>&2 printf "Error: file is not readable - '${file}'\n"
		exit_status=1
		continue
	fi

	hash="$(hexdump --no-squeezing --format '8/1 "%02X""\n"' -- "${file}" | XXH64)"

	printf "%s  %s\n" "${hash}" "${file}"
done

exit "${exit_status}"
