require 'Docking_Station'

describe DockingStation do
   it 'docking station releases bike' do
     bike = Bike.new
     expect(bike.working?).to equal(true)
   end
   it 'docks the bike' do
     bike = Bike.new
     expect(subject.dock(bike)).to include bike
   end
   it 'has specified capacity' do
      docking_station = DockingStation.new(1)
      bike = Bike.new
      expect(docking_station.dock(bike)).to include bike
      #issue in line 17
      expect{docking_station.dock(Bike.new)}.to raise_error 'Docking station unavailable'
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
     describe '#dock' do
       it 'raises an error when the docking station is full' do
         capacity = 20
         capacity.times {subject.dock(Bike.new)}
         expect { subject.dock Bike.new }.to raise_error 'Docking station unavailable'
       end
     end
end
end
