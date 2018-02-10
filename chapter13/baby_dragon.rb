class Dragon
  ACTION_LIST = ['feed', 'toss', 'rock', 'walk', 'put to bed', 'put the dragon to bed', 'bed', 'quit' ]
  
  def initialize name
    @name = name
    @asleep = false
    @stuff_in_belly = 10    # he's full
    @stuff_in_intestine = 0 # he dosen't need to poop
    puts "#{@name} is born."
  end
  
  def feed
    puts "You feed #{@name}"
    @stuff_in_belly = 10
    passage_of_time
  end
  
  def walk
    puts "You walk #{@name}"
    @stuff_in_intestine = 0
    passage_of_time
  end
  
  def put_to_bed
    puts "You put #{@name} to bed."
    @asleep = true
    3.times do
      if @asleep
        passage_of_time
      end
      if @asleep
        puts "#{@name} snores, filling the room with smoke."
      end
    end
    if @asleep
      @asleep = false
      puts "#{@name} wakes up slowly."
    end   
  end
  
  def toss
    puts "You toss #{@name} up into the air."
    puts "The resulting giggles singe your eyebrows."
    passage_of_time
  end
  
  def rock
    puts "You rock #{@name} gently."
    @asleep = true
    puts "He briefly dozes off..."
    passage_of_time
    if @asleep
      @asleep = false
      puts "...but wakes up when you stop."
    end
  end

  def abandon
    outcome = rand(5)
    if outcome == 0
      puts "Wow, you're really going to leave #{@name}? Dragons make poor enemies"
    elsif outcome == 1
      puts "You prepared #{@name} well for life as an adult dragon."
      puts "Both of you know it's time, so, wiping your tears away, you part."
    elsif outcome == 2
      puts "As soon as you turn away, #{@name} roasts you alive."
      puts "That done, they go for the ketchup."
      puts "It's important to let meat rest, after all..."
    elsif outcome == 3
      puts "Years later, #{@name} still can't get over how you left without a word."
    elsif outcome == 4
      puts "I would say something about how cruel you are to leave a baby,"
      puts "but I doubt a monster like you would understand."
      puts "HOW COULD YOU LEAVE A BABY!!!!!"
    else
      puts "No one's quite sure what happened, but #{@name} seems happy you left."
    end
    exit
  end
  
  def valid_action(action)
    (ACTION_LIST.join('-') + '-').include?((action.to_s + '-'))
  end
  
  def do_action(action)
    if action == 'feed'
      feed
    elsif action == 'toss'
      toss
    elsif action == 'walk'
      walk
    elsif action == 'rock'
      rock
    elsif action == 'put to bed' || action == 'put the dragon to bed' || action == 'bed'
      put_to_bed
    elsif action == 'quit'
      abandon
    else
      puts "an unexpected error occurred. Can't figure out how to #{action}."
    end
      
  end
 
  # we're just going to make a method that loops endlessly unless the user wants to quit
  def interact
    while true
      puts "What would you like to do with #{@name}?"
      puts "You can feed, toss, walk, rock, put the dragon to bed, or quit."
      print "(enter your choice): "
      action = gets.chomp
      puts
      if valid_action(action)
        puts "I think tis is a valid action"
        do_action(action)
      else
        puts "I don't know what #{action} means. Try again."
      end
      puts
    end
  end
  
  private
  # "private" means that the methods defined here are internal
  # to the object. (You can feed the dragon, but can't ask if it's hungry)
  
  def hungry?
    @stuff_in_belly <= 2
  end
  
  def poopy?
    @stuff_in_intestine >= 8
  end

  def passage_of_time
    if @stuff_in_belly > 0
      @stuff_in_belly -= 1
      @stuff_in_intestine += 1
    else
      if @asleep
        @asleep = false
        puts "The dragon wakes up suddenly!"
      end
      puts "#{@name} is starving, and ate YOU in desperation!"
      exit
    end
    
    if @stuff_in_intestine >= 10
      @stuff_in_intestine = 0
      puts "Whoops! #{@name} had an accident..."
    end
    
    if hungry?
      if @asleep
        @asleep = false
        puts "#{@name} wakes up suddenly!"
      end
      puts "Your dragon's stomach is grumbling..."
    end
    
    if poopy?
      if @asleep
        @asleep = false
        puts "He wakes up suddenly!"
      end
      puts "#{@name} does the potty dance..."
    end
  end
  
end
  
puts "You happen upon something shiny.. and moving?"
puts "It's an egg, and suddenly a tiny head cracks through."
puts "The slimy little thing has a pointed face, wings,"
puts " and oh my, it just burped fire!"
puts "It's tiny reptilian face gazes lovingly up at you."
print "What would you like to name your new baby dragon? "
puts
name = gets.chomp
pet = Dragon.new(name)
pet.interact