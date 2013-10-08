# life.rb
# Conway's Game of Life in Ruby

ALIVE_CHAR = 'X'

# Uses ARGF to grab seed from a file or stdin.
# Returns a two-dimensonal array representing the seed.
def get_seed
  rows = []
  ARGF.each_line do |line|
    row = []
    line.chomp.each_char do |c|
      if c == ALIVE_CHAR
        row << 1        
      else
        row << 0
      end      
    end
    rows << row
  end
  rows
end

# Display a generation of cells.
def show_gen(gen)
  for i in 0..gen.length-1
    for j in 0..gen[i].length-1
      print gen[i][j] == 1 ? '@' : '.'
    end
    puts
  end
end

def get_num_live_neighbours(gen, i, j)
  live_neighbours = get_neighbour_to_north(gen, i, j)
  live_neighbours += get_neighbour_to_east(gen, i, j)
  live_neighbours += get_neighbour_to_south(gen, i, j)
  live_neighbours += get_neighbour_to_west(gen, i, j)
end

def get_neighbour_to_north(gen, i, j)
  ii = i - 1
  return 0 if ii < 0 
  gen[ii][j]  
end

def get_neighbour_to_east(gen, i, j)
  jj = j + 1
  return 0 if jj >= gen.length
  gen[i][jj]
end

def get_neighbour_to_south(gen, i, j)
  ii = i + 1
  return 0 if ii >= gen.length 
  gen[ii][j]  
end

def get_neighbour_to_west(gen, i, j)
  jj = j - 1
  return 0 if jj < 0
  gen[i][jj]
end

def decide_fate(gen, i, j)
  neighbours = get_num_live_neighbours(gen, i, j)
  if gen[i][j] == 1
    if neighbours < 2
      return 0
    elsif neighbours == 2 or neighbours == 3
      return 1
    else
      return 0
    end
  else
    if neighbours == 3
      return 1
    else
      return 0
    end
  end
end

# Get the next generation of cells
def tick(gen)
  next_gen = Marshal.load(Marshal.dump(gen))
  for i in 0..gen.length-1
    for j in 0..gen[i].length-1
      next_gen[i][j] = decide_fate(gen, i, j)
    end
  end
  next_gen
end

next_gen = get_seed
show_gen(next_gen)
puts '------seed'

10.times do
  next_gen = tick(next_gen)
  show_gen(next_gen)
  puts '------'
end
