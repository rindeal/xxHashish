xxhashi.sh: xxhashi.sh.in
	m4 $< > $@
# un-comment the following line to prevent minifying the script
# no-minify:
#	flatten multiline statements
	perl -p -e 's/\s*\\\n/ /' -i -- $@
#	remove comments
	sed -r -e '/^[[:space:]]*#/d' -e 's/[[:space:]]{1,}#.*$$//' -i -- $@
#	remove leading/trailing spaces
	sed -r -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$$//' -i -- $@
#	remove blank lines
	sed -r -e '/^[[:space:]]*$$/d' -i -- $@
#	remove spaces inside arithmetic statements
	gawk -f del_arith_ws.awk -i inplace -- $@
#	flatten all lines
	gawk -e '{ \
		printf("%s", $$0); \
		if ($$0 ~ /({|else|then|do)$$/) { \
			printf(" "); \
		} else if ($$0 ~ /\(\)$$/) { \
		} else { \
			printf(";"); \
		} \
	}' -i inplace -- $@
#	trim whitespaces to one
	sed -r -e 's/[[:space:]]{1,}/ /g' -i -- $@
