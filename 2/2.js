const {readFileSync} = require('fs')
const mem = (function load() {
  return String(readFileSync('/dev/stdin')).split(',').map(a => +a)
}())

function exeOp(mem, ip) {
  if (mem[ip] === 99) { return 1 }
  const op = mem[ip], ai = mem[ip + 1], bi = mem[ip + 2], ci = mem[ip + 3]
  if      (op === 1) { mem[ci] = mem[ai] + mem[bi] }
  else if (op === 2) { mem[ci] = mem[ai] * mem[bi] }
  return 4
}

function execute(mem) {
  let ip = 0
  while (mem[ip] !== 99) { ip += exeOp(mem, ip) }
  return mem[0]
}

{ // Part 1.
  const part1mem = mem.slice();
  [part1mem[1], part1mem[2]] = [12, 2]
  const output = execute(part1mem)
  console.log(output)
}

// Part 2.
function bruteForceSearch(n) {
  for (let i = 0; i <= 99; i++) {
    for (let j = 0; j <= 99; j++) {
      const m = mem.slice();
      [m[1], m[2]] = [i, j]
      if (execute(m) === n) { return m }
    }
  }
  return []
}
const part2mem = bruteForceSearch(19690720)
console.log(100 * part2mem[1] + part2mem[2])
