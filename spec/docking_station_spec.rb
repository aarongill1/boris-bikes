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
         20.times {subject.dock(Bike.new)}
         expect { subject.dock Bike.new }.to raise_error 'Docking station unavailable'
       end
     end
end
end
