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
    raise 'You cannot allow landing in the middle of the storm!!' if stormy?
    raise 'Airport is full!' if full?
    plane.land!
    @planes << plane
  end

  def planes_count
    @planes.count
  end

  def release(plane)
    raise 'You cannot allow taking off in the middle of the storm!!' if stormy?
    plane.take_off!
    @planes.delete(plane) if @planes.include?(plane)
  end 

  def full?
    planes_count == @capacity
  end

end