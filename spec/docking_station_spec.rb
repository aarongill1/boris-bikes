require 'Docking_Station'

describe DockingStation do
  docking_station = DockingStation.new
  it 'responds to method release_bike' do
    expect(subject).to respond_to :release_bike
  end
   it 'docking station releases bike' do
     bike = docking_station.release_bike
     expect(bike.working?).to equal(true)
   end
   it 'docks the bike' do
     bike = Bike.new
     expect(subject.dock(bike)).to eq bike
   end

   it "responds to bike" do
     expect(subject).to respond_to :bike
   end
end
