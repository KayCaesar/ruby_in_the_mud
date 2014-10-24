require_relative "lib/ruby_in_the_mud/version"
require_relative "lib/ruby_in_the_mud/behavior"
require_relative "lib/ruby_in_the_mud/entity"
require_relative "lib/ruby_in_the_mud/rollers.rb"

Dir["lib/ruby_in_the_mud/inputs/*.rb"].each {|file| puts file;   require_relative file }
Dir["lib/ruby_in_the_mud/inputs/ais/*.rb"].each {|file| require_relative file }
Dir["lib/ruby_in_the_mud/droppers/*.rb"].each {|file| require_relative file }

module RubyInTheMud


    evil_monster = EntityTemplate.new do
      on :create, StatsRoller.new(level: 5)
      on :create, LootRoller.new(level: 5)
      decides_movement_with FlyingAI.new
      decides_aggression_with AngryAI.new
      on :move do
        puts "#{self.name} flaps its wings"
      end
      on :death,   LootDropper.new()
    end

    player = EntityTemplate.new do
      player_input = PlayerInput.new
      on :create, StatsRoller.new(level: 10)
      on :create, LootRoller.new(level: 10)
      controlled_by player_input
      on :death,   LootDropper.new()

    end


    bat = evil_monster.spawn("Bat")
    this_player = player.spawn("Bat")
    entities = [evil_monster, this_player]
    while true
      bat.move
      this_player.tick


    end
end
