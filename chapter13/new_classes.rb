class Die
  def initialize
    roll
  end
  
  def cheat(num)
    if num <= 6 && num >= 1
      @number_showing = num
    else
      nil
    end
  end
  
  def roll
    @number_showing = 1 + rand(6)
  end
  
  def showing
    @number_showing
  end
end
  
dice = [Die.new, Die.new]

dice.each do |die|
  puts die.showing
end

dice.each do |die|
  die.roll
  puts die.showing
end

dice.each do |die|
  die.cheat(1)
  puts die.showing
end



