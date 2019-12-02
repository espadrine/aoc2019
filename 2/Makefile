include ../.env
DAY = 2

run: a input
	@<input ./a

a: $(DAY).js input
	(echo '#!/bin/bash'; echo 'node 2') >a
	chmod +x a

input:
	curl -sO 'https://adventofcode.com/2019/day/$(DAY)/input' -H "Cookie: session=$(AOCSESSION)"

.PHONY: run
