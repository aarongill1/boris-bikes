require 'Docking_Station'

describe DockingStation do
   it 'docks the bike' do
     bike = Bike.new
     expect(subject.dock(bike)).to include bike
   end
   it 'has specified capacity' do
      docking_station = DockingStation.new(1)
      bike = Bike.new
      expect(docking_station.dock(bike)).to include bike
      expect{docking_station.dock(Bike.new)}.to raise_error 'Docking station unavailable'
   end
   it 'has no specified capacity and uses default value' do
     docking_station = DockingStation.new
     bike = Bike.new
     DockingStation::DEFAULT_CAPACITY.times { docking_station.dock(Bike.new)}
     expect{docking_station.dock(bike)}.to raise_error 'Docking station unavailable'
   end

   describe '#release_bike' do
     it 'docking station releases bike' do
       bike = Bike.new
       subject.dock(bike)
       expect(subject.release_bike).to eq bike
     end
     it 'raises and error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
     end
  end
end
