module Weather

  def weather_condition
    rand(1..101) >= 80 ? 'stormy' : 'sunny'
  end

end