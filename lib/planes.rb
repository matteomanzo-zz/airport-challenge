require './lib/weather'

class Plane

  include Weather


  def initialize
    @status = 'flying'
  end

  def status
    @status
  end

  def take_off!
    raise 'You cannot take off in the middle of the storm!!' if weather_condition == 'stormy'
    @status = 'flying'
  end

  def land!
    raise 'You cannot land in the middle of the storm!!' if weather_condition == 'stormy'
    @status = 'landed'
  end
end