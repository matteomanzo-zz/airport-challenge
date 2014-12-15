
# A plane currently in the airport can be requested to take off.
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
# If the airport is full then no planes can land

require './lib/airport.rb'
require './lib/planes.rb'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  context 'taking off and landing' do

    before {allow(airport).to receive(:stormy?).and_return(false)}

    it 'a plane can land' do
      airport.dock(plane)
      expect(airport.planes_count).to eq(1)
    end

    it 'a plane can take off' do
      airport.dock(plane)
      airport.release(plane)
      expect(airport.planes_count).to eq(0)
    end
  end

  context 'traffic control' do

    before {allow(airport).to receive(:stormy?).and_return(false)}
    before {allow(plane).to receive(:stormy?).and_return(false)}

    it 'a plane cannot land if the airport is full' do
      plane.land!
      6.times {airport.dock(plane)}
      expect(lambda { airport.dock(plane) }).to raise_error(RuntimeError, 'Airport is full!')
    end

    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'weather conditions' do

      before {allow(airport).to receive(:stormy?).and_return(true)}

      it 'airport cannot allow taking off when there is a storm brewing' do
        expect(lambda { airport.release(plane) }).to raise_error(RuntimeError, 'You cannot allow taking off in the middle of the storm!!')
      end

      it 'airport cannot allow landing in the middle of a storm' do
        expect(lambda { airport.dock(plane) }).to raise_error(RuntimeError, 'You cannot allow landing in the middle of the storm!!')
      end
    end
  end
end
