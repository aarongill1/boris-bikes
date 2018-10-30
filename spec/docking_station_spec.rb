require 'Docking_Station'

describe DockingStation do
docking_station = DockingStation.new
  it 'responds to method release_bike' do
    expect(docking_station).to respond_to :release_bike
  end
   it 'docking station releases bike' do
     bike = docking_station.release_bike
     expect(bike.working?).to equal(true)
end
end
