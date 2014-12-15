
# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
# When the plane takes of from the airport, the plane's status should become "flying"

require 'planes'

describe Plane do

  let(:plane) { Plane.new }

    it 'should have a flying status when created' do
      expect(plane.is_flying?).to eq true
    end

    it 'can take off' do
      plane.take_off!
      expect(plane.is_flying?).to eq true
    end

    it 'can land' do
      plane.land!
      expect(plane.is_flying?).to eq false
    end

    it 'changes its status to flying after taking of' do
      plane.land!
      plane.take_off!
      expect(plane.is_flying?).to eq true
    end
end