class Planes
  def initialize
    @status = 'flying'
  end

  def status
    @status
  end

  def take_off!
    @status = 'flying'
  end
end
