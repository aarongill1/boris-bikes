require 'Docking_Station'

describe DockingStation do
   it 'has specified capacity' do
      docking_station = DockingStation.new(1)
      docking_station.dock(double(:bike))
      expect{docking_station.dock(bike)}.to raise_error 'Docking station unavailable'
   end
   it 'has no specified capacity and uses default value' do
     DockingStation::DEFAULT_CAPACITY.times { subject.dock(double(:bike))}
     expect{subject.dock(bike)}.to raise_error 'Docking station unavailable'
   end

   describe '#release_bike' do
     it 'docking station releases bike' do
       subject.dock(double(:bike))
       expect(subject.release_bike).to eq bike
     end
     it 'raises an error when there are no working bikes available' do
       expect { subject.release_bike }.to raise_error 'No working bikes available'
       subject.dock(double(:bike))
       expect { subject.release_bike }.to raise_error 'No working bikes available'
     end
     it 'only releases working bikes' do
       subject.dock(double(:working_bike))
       subject.dock(double(:broken_bike))
       released_bike = subject.release_bike
       expect(released_bike.working?).to eq(true)
     end
  end
end
