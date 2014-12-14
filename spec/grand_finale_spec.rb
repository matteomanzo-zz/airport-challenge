# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

require './lib/airport.rb'
require './lib/planes.rb'

describe "The grand finale (last spec)" do

  let(:airport) { Airport.new }

  it 'all planes can land' do
    expect(planes.status).to eq 'landed'
    end
   
end
