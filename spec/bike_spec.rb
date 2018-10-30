require 'Bike'

describe Bike do
  it "responds to method working?" do
    bike = Bike.new
    expect(bike).to respond_to :working?
    end
end
