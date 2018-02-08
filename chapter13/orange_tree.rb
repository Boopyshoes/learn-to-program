class OrangeTree
  
  def initialize
    # The idea here is to create a new class representing an orange tree
    # The tree must age, growing taller each year
    # The tree must die after some number of years
    # The tree must not produce fruit initially, but after some number of years it should start
    # As it ages it should produce more
    # you must be able to count the oranges
    # you must be able to pick the fruit (if any is left)
    # at t)he end of the year, all of the fruit should fall off
    # remember that the @ means a variable is an instance variable
    @age = 0                 # age in years
    @height = 0              # height in inches, because I'm american and we still think in feet
    @base_growth_rate = 12   # I'd like to do something interisting here, like base it on rainfall or something
    @growth_rate = calculate_growth_rate
    @num_oranges = 0
    @productive_age = 4 + rand(3) # tree will start producing fruit between 4 and 6 years of age
    one_year_passes     # I think this makes sense, start off by aging the tree a year
    
  end

  def pick_orange
    
    if @num_oranges > 0
      @num_oranges -= 1  
      puts "You reach up and grab a ripe orange from the tree. It smells delicious!"
    elsif @num_oranges == 0 && @age >= @productive_age
      puts "You try to find an orange to pick, but it looks like they are gone for the year"
    else
      puts "It looks like this tree is still too young to produce oranges."
      puts "Better luck next year!"
    end
    
  end
  
  def count_the_oranges
    puts "You look up at the tree. It looks like there are #{@num_oranges}"
    if @age < @productive_age
      puts "This tree is still too young to produce oragnes."
    end
  end
  
  def one_year_passes
    # tree should grow, lose all previous fruit, grow new fruit(if old enough), and possibly die
  end
  
  private
  def calculate_growth_rate
    # calculate the growth rate based on whatever seems natural
    @base_growth_rate * rand (1.0..2.25)
  end

end

#guys, I'm sorry but I think I'm too tired to do this tongiht I cant' even type
