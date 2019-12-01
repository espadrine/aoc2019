include ../.env
DAY = 1

run: a input
	@<input ./a

a: $(DAY).cc input
	g++ -o $@ $<

input:
	curl -sO 'https://adventofcode.com/2019/day/$(DAY)/input' -H "Cookie: session=$(AOCSESSION)"

.PHONY: run
