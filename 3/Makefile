include ../.env
DAY = 3

run: a input
	@<input ./a

a: $(DAY).cr input
	crystal build -o $@ $<

input:
	curl -sO 'https://adventofcode.com/2019/day/$(DAY)/input' -H "Cookie: session=$(AOCSESSION)"

.PHONY: run
