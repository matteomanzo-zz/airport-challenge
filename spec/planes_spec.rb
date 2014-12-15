
# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
# When the plane takes of from the airport, the plane's status should become "flying"

require 'planes'

describe Plane do

  let(:plane) { Plane.new }

  context 'clear weather' do

    before {allow(plane).to receive(:weather_condition).and_return('sunny')}

    it 'should have a flying status when created' do
      expect(plane.status).to eq 'flying'
    end

    it 'can take off' do
      plane.take_off!
      expect(plane.status).to eq 'flying'
    end

    it 'can land' do
      plane.land!
      expect(plane.status).to eq 'landed'
    end

    it 'changes its status to flying after taking of' do
      plane.land!
      plane.take_off!
      expect(plane.status).to eq 'flying'
    end
  end

  context 'storm!!' do

    before {allow(plane).to receive(:weather_condition).and_return('stormy')}

    it 'a plane cannot land in the middle of a storm' do
      expect( lambda {plane.land!} ).to raise_error(RuntimeError, 'You cannot land in the middle of the storm!!')
    end

    it 'a plane cannot take off in the middle of a storm' do
      expect( lambda {plane.take_off!} ).to raise_error(RuntimeError, 'You cannot take off in the middle of the storm!!')
    end
  end
end
