class EntityTemplate
  def initialize(&lifecycle_block)
    @lifecycle_block = lifecycle_block
  end

  def spawn(name)
    fail 'no lifecycle' unless @lifecycle_block
    new_entity = EntityInstance.new(name, @lifecycle_block)
  end
end
