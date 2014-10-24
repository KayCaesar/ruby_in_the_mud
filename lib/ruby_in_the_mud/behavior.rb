module LifecycleNotification 
  def guarantee_initialized
    #create an empty array if we access an unused key
    @observers ||= Hash.new{|hash, key| hash[key] = Array.new}
  end
  
  def on(lifecycle_point, *observers, &block_observer)
    raise "Must supply a lifecycle point." unless lifecycle_point 
    guarantee_initialized
    
    observers.each do |observer|
      add_observer(lifecycle_point, observer)
    end

    add_observer(lifecycle_point, block_observer)  if block_observer

  end

  def trigger(lifecycle_point) 
    guarantee_initialized
    #blocks and objects can both be used as observers, call different method
    #based on which one it is
    @observers[lifecycle_point].each do |observer|
      case observer
      when Proc
        observer.call(self)
      when Object
        observer.run(self)
      else
        raise "Ill-formed observer"
      end
    end
  end

  def add_observer(lifecycle_point, observer)
    @observers[lifecycle_point] << observer
  end

end

