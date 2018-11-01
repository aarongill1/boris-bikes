require 'Docking_Station'

describe DockingStation do
   it 'has specified capacity' do
      docking_station = DockingStation.new(1)
      docking_station.dock(Bike.new)
      expect{docking_station.dock(Bike.new)}.to raise_error 'Docking station unavailable'
   end
   it 'has no specified capacity and uses default value' do
     DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new)}
     expect{subject.dock(Bike.new)}.to raise_error 'Docking station unavailable'
   end

   describe '#release_bike' do
     it 'docking station releases bike' do
       bike = Bike.new
       subject.dock(bike)
       expect(subject.release_bike).to eq bike
     end
     it 'raises an error when there are no working bikes available' do
       expect { subject.release_bike }.to raise_error 'No working bikes available'
       bike = Bike.new
       bike.report_broken
       subject.dock(bike)
       expect { subject.release_bike }.to raise_error 'No working bikes available'
     end
     it 'only releases working bikes' do
       subject.dock(Bike.new)
       bike = Bike.new
       bike.report_broken
       subject.dock(bike)
       released_bike = subject.release_bike
       expect(released_bike.working?).to eq(true)
     end
  end
end
