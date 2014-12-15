require './lib/planes.rb' 
require './lib/weather.rb'

class Airport
  
  include Weather

  DEFAULT_CAPACITY = 6

  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def dock(plane)
    raise 'You cannot land if it\'s stormy' if weather_condition == 'stormy'
    raise 'Airport is full!' if full?
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
    raise 'You cannot take off if it\'s stormy' if weather_condition == 'stormy'
    if plane.status == 'flying'
      @planes.delete(plane)
    end
  end

  def full?
    planes_count == @capacity
  end

end