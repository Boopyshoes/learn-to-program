# These are just to make the map easier for me to read.
# "M" is visually more dense than "o".

M = 'land'
o = 'water'

world = [
  [o,o,o,o,o,o,o,o,o,o,o],
  [o,o,M,M,o,o,o,o,o,o,o],
  [o,o,o,o,o,o,o,o,M,M,o],
  [o,o,o,M,o,o,o,o,o,M,o],
  [o,o,o,M,o,M,M,o,o,o,o],
  [o,o,o,M,M,M,M,o,o,o,o],
  [o,o,M,M,M,M,M,M,M,M,M],
  [o,o,M,M,o,o,M,M,M,o,o],
  [o,o,o,o,o,o,M,M,o,o,o],
  [o,M,o,o,M,o,M,o,o,o,o],
  [o,o,o,o,o,o,M,o,o,o,o]]

def continent_size(world,x,y)
  world_size_x = 11 - 1 # 11 long minus 1 for zero indexed arrays
  world_size_y = 11 - 1 # 11 long minus 1 for zero indexed arrays
  
  if !((x >= 1) && (x <= world_size_x) && (y >= 1) && (y <= world_size_y))
    return 0
  else
    puts 'I\'m standing at (' + x.to_s + ',' + y.to_s + ') and it is a ' + world[y][x] + ' tile.'
    if world[y][x] != 'land'
      # Either it's water or we already counted it,
      # but either way, we don't want to count it now
      return 0
    end
    # so first we count this tile
    size = 1
    world[y][x] = 'counted land'
    # ...then we count all of the neighboring 8 tiles
    # (and, of course, their neighbors by way of the recursion).
    
    size = size + continent_size(world, x-1, y-1)
    size = size + continent_size(world, x  , y-1)
    size = size + continent_size(world, x+1, y-1)
    size = size + continent_size(world, x-1, y  )
    size = size + continent_size(world, x+1, y  )
    size = size + continent_size(world, x-1, y+1)
    size = size + continent_size(world, x  , y+1)
    size = size + continent_size(world, x+1, y+1)
    size
  end
                                            
end

puts 'The continent size is ' + continent_size(world, 5, 5).to_s + ' tiles.'
