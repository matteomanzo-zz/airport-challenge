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
    raise 'You cannot allow landing in the middle of the storm!!' if weather_condition == 'stormy'
    raise 'Airport is full!' if full?
    plane.status == 'landed' ? @planes << plane : 'No planes have landed'
  end

  def planes_count
    @planes.count
  end

  def release(plane)
    raise 'You cannot allow taking off in the middle of the storm!!' if weather_condition == 'stormy'
    @planes.delete(plane) if plane.status == 'flying' 
  end

  def full?
    planes_count == @capacity
  end

end