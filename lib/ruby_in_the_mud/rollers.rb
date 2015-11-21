class Roller
  def initialize(attribute_specification)
    @level = attribute_specification[:level] || 1
  end
end
class StatsRoller < Roller
  def run(entity)
    puts 'rolling stats'
    entity.hp = Random.rand(@level)
  end
end
class LootRoller  < Roller
  def run(entity)
    puts 'rolling loot'
    entity.loot = [:junk, :more_junk]
  end
end
