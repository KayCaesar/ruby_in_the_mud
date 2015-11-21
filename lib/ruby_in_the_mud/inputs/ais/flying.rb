puts 'loaded flying'
class FlyingAI
  def tick
    [:west, :east, :north, :south].sample
  end
end
