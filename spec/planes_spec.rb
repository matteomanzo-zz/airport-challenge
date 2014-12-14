require 'planes'

describe Planes do

  let(:plane) { Planes.new }

  it 'should have a flying status when created' do
    expect(plane.status).to eq 'flying'
  end

# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"

  it 'can take off' do
    allow(plane).to receive(:weather_condition).and_return('sunny')
    expect(plane.status).to eq 'flying'
  end

  it 'can land' do
    allow(plane).to receive(:weather_condition).and_return('sunny')
    plane.land!
    expect(plane.status).to eq 'landed'
  end

  it 'changes its status to flying after taking of' do
    allow(plane).to receive(:weather_condition).and_return('sunny')
    plane.land!
    plane.take_off!
    expect(plane.status).to eq 'flying'
  end
end
