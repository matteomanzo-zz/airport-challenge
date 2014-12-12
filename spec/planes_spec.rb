require './lib/planes.rb'

describe Planes do

  let(:plane) { Planes.new }

  it 'should have a flying status when created' do
    expect(plane.fly_status)
  end
end