module Weather

  def weather_condition
    rand(1..101) >= 99 ? 'stormy' : 'sunny'
  end

end