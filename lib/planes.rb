class Plane

  def initialize
    @flying = true
  end

  def take_off!
    @flying = true
  end

  def land!
    @flying = false
  end

  def is_flying?
    @flying
  end
end