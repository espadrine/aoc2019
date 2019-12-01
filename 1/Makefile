include ../.env

a: 1.cc input
	g++ -o $@ $<

input:
	curl -sO 'https://adventofcode.com/2019/day/1/input' -H "Cookie: session=$(AOCSESSION)"
