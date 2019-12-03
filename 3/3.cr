# Part 1.

UP = 0
RIGHT = 1
DOWN = 2
LEFT = 3
DIRECTION = {
  'U' => UP,
  'R' => RIGHT,
  'D' => DOWN,
  'L' => LEFT,
}

wires = STDIN.gets_to_end.lines.map do |line|
  line.chomp.split(",").map do |p|
    [DIRECTION[p[0]], p[1..-1].to_i]
  end
end

def move(p, dir)
  if dir == UP
    [p[0], p[1] - 1]
  elsif dir == RIGHT
    [p[0] + 1, p[1]]
  elsif dir == DOWN
    [p[0], p[1] + 1]
  elsif dir == LEFT
    [p[0] - 1, p[1]]
  else
    [0, 0]
  end
end

def get_pos(wire)
  pos = [] of Array(Int32)
  p = [0, 0]
  wire.each do |dir|
    dir[1].times do
      p = move(p, dir[0])
      pos << p
    end
  end
  pos
end

def dist(a, b)
  (a[0] - b[0]).abs + (a[1] - b[1]).abs
end

def get_intersections(wires)
  positions = wires.map { |w| get_pos(w) }
  positions.reduce(positions[0]) { |acc, p| acc & p }
end

def find_nearest(cells)
  cells.min_by { |c| dist([0, 0], c) }
end

intersections = get_intersections(wires)
puts dist([0, 0], find_nearest(intersections))

# Part 2.

def get_latencies(wire)
  latencies = { [0, 0] => 0 }
  latency = 0
  p = [0, 0]
  wire.each do |dir|
    dir[1].times do
      p = move(p, dir[0])
      latency += 1
      latencies[p] = latency
    end
  end
  latencies
end

def latency_dist(a, latencies)
  latencies[0][a] + latencies[1][a]
end

def find_nearest_with_latency(cells, latencies)
  cells.min_by { |c| latency_dist(c, latencies) }
end

latencies = wires.map { |w| get_latencies(w) }
puts latency_dist(
  find_nearest_with_latency(intersections, latencies), latencies)
