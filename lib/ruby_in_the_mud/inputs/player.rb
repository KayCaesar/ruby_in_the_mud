class PlayerInput
  def tick
    @input = get_input
    case @input
    when /w(est)?/
      puts "moving west"
    when /e(ast)?/
      puts "moving east"
    when /n(orth)?/
      puts "moving north"
    when /s(outh)?/
      puts "moving south"

    end
  end
  def get_input
    gets.chomp
    
  end
  def should_attack?
    case @input  
    when /^y(es)?/
      true
    when /^no?/
      false
    else
      false
    end
  end
  
end
