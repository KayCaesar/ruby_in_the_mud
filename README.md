# RubyInTheMud
This is an experimental foray into creating a flexible DSL for a particular purpose. In this case, it's for the purpose of demonstrating an entity creation system for MUDs or Roguelike games. Not suitable for real usage, but was informative nonetheless.

##Example
The following example demonstrates using this DSL to create a few entities in the system, instill on them the proper behavior and then enter a game loop:
```ruby
    #monster template
    evil_monster = EntityTemplate.new do
      on :create, StatsRoller.new(level: 5)
      on :create, LootRoller.new(level: 5)
      #spawn some simple AIs and delegate responsibility to them
      decides_movement_with FlyingAI.new
      decides_aggression_with AngryAI.new
      #Don't need to create an object to handle events, you can just use a block!
      on :move do
        puts "#{self.name} flaps its wings"
      end
      on :death,   LootDropper.new()
    end
    #Player template
    player = EntityTemplate.new do
      player_input = PlayerInput.new
      #creation hooks
      on :create, StatsRoller.new(level: 10)
      on :create, LootRoller.new(level: 10)
      #control this entity through player input
      controlled_by player_input
      #death hook
      on :death,   LootDropper.new()

    end

    bat = evil_monster.spawn("Bat")
    this_player = player.spawn("Bat")
    entities = [evil_monster, this_player]
    while true
    #game loop
      bat.move
      this_player.tick
    end
```
