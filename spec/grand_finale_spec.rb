
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
    allow(airport).to receive(:stormy?).and_return(false)
  end

  
  it 'all planes can land' do
    planes.map(&:land!)
    expect(planes.map(&:flying)).to eq(6.times.collect{false})
  end

  it 'airport should be full' do
    planes.each {|plane| airport.dock(plane)}
    expect(airport).to be_full
  end

  it 'all planes can take_off' do
    planes.each {|plane| airport.dock(plane)}
    planes.each {|plane| airport.release(plane)}
    expect(planes.map(&:flying)).to eq(6.times.collect{true})
  end

  it 'airport should be empty' do
    planes.each {|plane| airport.dock(plane)}
    planes.each {|plane| airport.release(plane)}
    expect(airport.planes).to be_empty
  end
end
