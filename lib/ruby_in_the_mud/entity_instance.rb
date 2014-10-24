class EntityInstance
  include LifecycleNotification
  #basic attributes all entities have
  attr_accessor :hp, :loot, :name
  def initialize(name, lifecycle_block)
    @name = name
    @loot =[]
    @hp = 0
    #use the lifecycle block passed to its template to configure a particular instance
    instance_exec(&lifecycle_block)
    #we are now 'creating' the entity from the perspective of the client API
    trigger(:create)
  end

  #Allows you to specify an AI that chooses movement patterns
  def decides_movement_with(ai)
    @movement_ai = ai
  end
def decides_aggression_with(ai)
    @aggression_ai = ai
  end

def controlled_by(intelligence)
  @master_intelligence = intelligence
end
def tick
  if @master_intelligence
    
  @master_intelligence.tick
  else
    @movement_ai.tick
  end
  
end

  def move
   puts @movement_ai.tick
  end
  def die
    trigger(:die)
  end
end

