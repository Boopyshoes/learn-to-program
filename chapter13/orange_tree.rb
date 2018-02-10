class OrangeTree
        
    # Some googling I did between streams tells me that orange trees are even in width and height
    # I looked but had a hard time finding height/trunk ratios or growth per year charts that I could make
    # sense of, but I did find out that standard orange trees grow to 18-25 ft tall/wide and that their trunks
    # can be as big as 10 ft around, so... I'm going to establish a height/trunk growth ratio of 2.5:1
    # I'm leaving these here because we can always adjust them later if needed
    # It's possible that representing them as Class constants isn't good, but it makes sense to me
    # After all, these are 'facts' pertaining to all orange trees(class),
    # not just a specific tree (instance)
    HEIGHT_GROWTH_FACTOR = 1
    WIDTH_GROWTH_FACTOR = 1 
    TRUNK_GROWTH_FACTOR = 0.4
    BASE_GROWTH_RATE = [12,13,14,12,10, 9, 6, 5, 3, 3, # 87
                         3, 3, 3, 3, 3, 3, 3, 3, 2, 2, # 28 (115 total)
                         2, 2, 2, 2, 2, 2, 2, 2, 2, 2, # 20 (135 total)
                         2, 2, 2, 2, 2, 1, 1, 1, 1, 1, # 20 (150 total)
                         1, 1, 1, 1, 1, 1, 1, 1, 1, 1, # 10 (160 total)
                         1, 1, 1, 1, 1, 1, 1, 1, 1, 1, # 10 (170 total)
                         1, 1, 1, 1, 1, 1, 1, 1, 1, 1, # 10 (180 total)
                         1, 1, 1, 1, 1, 1, 1, 1, 1, 1, # 10 (190 total)
                         1, 1, 1, 1, 1, 1, 1, 1, 1, 1, # 10 (200 total)
                         1, 1, 1, 1, 1, 1, 1, 1, 1, 1, # 10 (210 total, so 17' 6" for min growth min life)
                         1, 1, 1, 1, 1, 1, 1, 1, 1, 1, # 10 (220 total) 
                         1, 1, 1, 1, 1, 1, 1, 1, 1, 1, # 10 (230 total, so 19' 2" for min growth max life)
                         ]                              # max growth max life will be 24' 11"

# time to stop fiddling with this and write some code. 17'6" - 24'11" is close enough. Lifespan??? *shrug*
  def initialize
    # so, did we do it?
    # yes. The idea here is to create a new class representing an orange tree
    # yes. The tree must age, growing taller each year
    # yes. The tree must die after some number of years
    # yes. The tree must not produce fruit initially, but after some number of years it should start
    # yes. As it ages it should produce more
    # yes. you must be able to count the oranges
    # yes. you must be able to pick the fruit (if any is left)
    # yes. at t)he end of the year, all of the fruit should fall off
    # WE DID IT!!!!!
    
    # I'd like to do something interesting here, like base it on rainfall or something
    # having said that I don't want to spend that long researching, so I'm going to
    @lifespan = 100 + rand(21) # natural lifespan between 100 and 120 years

    @age = 0                # age in years
    @height = 0             # dimensions in inches, because I'm american and we still think in feet
    @width = 0
    @trunk_diameter = 0
    @growth_rate = calculate_growth_rate # establish first year's growth rate
    @num_oranges = 0
    @productive_age = 4 + rand(3) # tree will start producing fruit between 4 and 6 years of age
    puts "You dig a little hole and spit a few orange seeds into it, thinking about the future."
        
  end

# All my accessors
  def age
    @age
  end
  
  def height
    @height
  end
  
  def width
    @width
  end
  
  def trunk_diameter
    @trunk_diameter
  end

# I don't think you should be able to determine what a tree's lifespan is externally,
# so...
  def alive
    @age < @lifespan
  end
  
  def immature
    @age < @productive_age
  end
  
  def barren
    @age >= (@lifespan - 5)
  end
  
  def print_height_in_feet
    puts "the tree is #{@height.to_i / 12}', #{@height.to_i % 12}\" tall"
  end
  
  def print_height_in_meters
    puts "the tree is #{@height.to_i / 38.4}m tall"
  end
  
  # we ran into a problem because our if block wasn't structured prperly
  def pick_orange
    
    if immature
      puts "It looks like this tree is still too young to produce oranges."
      puts "Better luck next year!"
    elsif barren
      puts "This tree is at the end of it's life and won't produce any oranges this year"
    else
      if @num_oranges > 0
        @num_oranges -= 1  
        puts "You reach up and grab a ripe orange from the tree. It smells delicious!"
      
      else @num_oranges == 0 && @age >= @productive_age
        puts "You try to find an orange to pick, but it looks like they are gone for the year"
      end
    end    
  end
  
  def count_oranges
    puts "You look up at the tree. It looks like there are #{@num_oranges}"
    if immature 
      puts "This tree is still too young to produce oragnes."
    elsif barren 
      puts "Looks like this tree doesn't have long left to live."
      puts "It's not going to produce any oranges this year."
    end
  end
  
  def one_year_passes
    
    # tree ages
    @age += 1
    
    # check for death
    if !alive
      tree_death
    end  
    # establish this year's growth rate
    @growth_rate = calculate_growth_rate
    
    # tree grows
    @width += @growth_rate * WIDTH_GROWTH_FACTOR
    @height += @growth_rate * HEIGHT_GROWTH_FACTOR
    @trunk_diameter += @growth_rate * TRUNK_GROWTH_FACTOR
    
    # lose all last year's oranges and grow new ones
    @num_oranges = grow_oranges

  end
  
  def print_stats
    print @height + ' '
    print @width + ' '
    print @trunk_diameter + ' '
    puts count_oranges
  end
  
  private
  
  def grow_oranges
    if !immature && !barren
      @num_oranges = ((@growth_rate/BASE_GROWTH_RATE[@age])**2 * @height / 2).to_i # I made this calculation up completely
    end
  end
  
  def calculate_growth_rate
    # calculate the growth rate based on whatever seems natural
    BASE_GROWTH_RATE[@age] * rand(1.0..1.3)
  end

  def tree_death
    puts "This old tree has finally seen the last of its #{@lifespan} years."
    puts "It was #{@height.to_i / 12}' #{@height.to_i % 12}\" tall, " +
         "#{width.to_i / 12}' #{width.to_i % 12}\" wide, " +
         "and had a trunk diameter of #{@trunk_diameter.to_i}\""
    puts "It will remain only as a leafless skeleton in the orchard, graying and weathering."
    puts "Thanks for all the fruit, buddy!"
    exit
  end
  
end
  
# Let's make a tree!
tree = OrangeTree.new

while tree.alive 
  tree.one_year_passes
  tree.print_height_in_meters
  tree.count_oranges
  tree.pick_orange
end

  