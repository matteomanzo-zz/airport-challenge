# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

require './lib/airport.rb'
require './lib/planes.rb'
require './lib/weather.rb'

describe "The grand finale (last spec)" do

  let(:airport) { Airport.new }
  let(:planes) { Array.new([ Planes.new, Planes.new, Planes.new, Planes.new, Planes.new, Planes.new])}
  
  it 'all planes can land' do
    allow(airport).to receive(:weather_condition).and_return('sunny')
    allow(planes.each {|plane| plane}).to receive(:weather_condition).and_return('sunny')
    planes.each {|plane| plane.land!}
    expect(planes.each {|plane| plane.status}).to eq('landed')
  end

  it 'airport should be full' do
    allow(airport).to receive(:weather_condition).and_return('sunny')
    allow(planes.each {|plane| plane}).to receive(:weather_condition).and_return('sunny')
    planes.each {|plane| plane.land!}
    planes.each {|plane| airport.dock(plane)}
    expect(airport).to be_full
  end

  it 'all planes can take_off' do
    allow(airport).to receive(:weather_condition).and_return('sunny')
    allow(planes.each {|plane| plane}).to receive(:weather_condition).and_return('sunny')
    planes.each {|plane| plane.land!}
    planes.each {|plane| airport.dock(plane)}
    planes.each {|plane| plane.take_off!}
    planes.each {|plane| airport.release(plane)}
    expect(planes.each {|plane| plane.status}).to eq('flying')
  end

  it 'airport should be empty' do
    allow(airport).to receive(:weather_condition).and_return('sunny')
    allow(planes.each {|plane| plane}).to receive(:weather_condition).and_return('sunny')
    planes.each {|plane| plane.land!}
    planes.each {|plane| airport.dock(plane)}
    planes.each {|plane| plane.take_off!}
    planes.each {|plane| airport.release(plane)}
    expect(airport.planes).to be_empty
  end

end
