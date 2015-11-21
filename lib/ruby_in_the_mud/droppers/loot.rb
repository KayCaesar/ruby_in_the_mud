class LootDropper
  def run(entity)
    puts 'run'
    entity.loot.each do |loot|
      puts "Dropping loot #{loot}"
    end
  end
end
