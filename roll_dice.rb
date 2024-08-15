class Die
  attr_reader :sides, :value

  def initialize(sides)
    @sides = sides
    @value = roll
  end

  def roll
    @value = rand(1..@sides)
  end
end

class DiceRoll
  attr_reader :dice, :results

  def initialize(dice)
    @dice = dice.map { |sides| Die.new(sides) }
    @results = @dice.map(&:value)
  end

  def total
    @results.sum
  end

  def description
    dice_description = @dice.map { |die| "#{die.sides}-sided die" }.join(", ")
    "Rolled #{dice_description}: #{results.join(", ")} (Total: #{total})"
  end
end

def start_dice_simulator
  puts "Welcome to the Dice Rolling Simulator!"

  print "Enter the number of dice: "
  num_dice = gets.chomp.to_i

  dice = []
  num_dice.times do |i|
    print "Enter the number of sides for die ##{i + 1}: "
    sides = gets.chomp.to_i
    dice << sides
  end

  roll = DiceRoll.new(dice)
  puts roll.description
end

start_dice_simulator