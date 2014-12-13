require_relative 'planes.rb' 

class Airport
  
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def dock(plane)
    if plane.status == 'landed'
      @planes << plane
    else
      puts 'No planes have landed'
    end
  end

  def planes_count
    @planes.count
  end

  def release(plane)
    if plane.status == 'flying'
      @planes.delete(plane)
    end
  end
end