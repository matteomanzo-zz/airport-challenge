
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
  let(:planes) { 6.times.collect{Plane.new} }

  before do
    allow(airport).to receive(:weather_condition).and_return('sunny')
    
    planes.each do |plane|
      allow(plane).to receive(:weather_condition).and_return('sunny')
    end
  end

  
  it 'all planes can land' do
    planes.map(&:land!)
    expect(planes.map(&:status)).to eq(6.times.collect{'landed'})
  end

  it 'airport should be full' do
    planes.map(&:land!)
    planes.each {|plane| airport.dock(plane)}
    expect(airport).to be_full
  end

  it 'all planes can take_off' do
    planes.map(&:land!)
    planes.each {|plane| airport.dock(plane)}
    planes.map(&:take_off!)
    planes.each {|plane| airport.release(plane)}
    expect(planes.map(&:status)).to eq(6.times.collect{'flying'})
  end

  it 'airport should be empty' do
    planes.map(&:land!)
    planes.each {|plane| airport.dock(plane)}
    planes.map(&:take_off!)
    planes.each {|plane| airport.release(plane)}
    expect(airport.planes).to be_empty
  end
end
