#!/usr/bin/env gawk

BEGIN {
	FS=""
	pattern="\\$\\(\\("
}

$0 ~ pattern {
	for(i = 1 ; i <= NF ; i++) {
		printf("%s", $i)
		if ($i == "$")
			i++
		else
			continue

		printf("%s", $i)
		if ($i == "(")
			i++
		else
			continue

		printf("%s", $i)
		if ($i == "(")
			i++
		else
			continue

		bracket_stack=0
		for(j = i ; j <= NF ; j++) {
			if ($j == "(")
				bracket_stack++

			if ($j == ")") {
				if (bracket_stack > 0) {
					bracket_stack--
				} else {
					printf("%s", $j)
					break
				}
			}

			if(!($j == " " || $j == "\t"))
				printf("%s", $j)
		}
		i=j
	}
	printf("\n")
}

$0 !~ pattern { print }
