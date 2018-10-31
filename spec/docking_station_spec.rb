require 'Docking_Station'

describe DockingStation do
   it 'docking station releases bike' do
     bike = Bike.new
     expect(bike.working?).to equal(true)
   end
   it 'docks the bike' do
     bike = Bike.new
     expect(subject.dock(bike)).to eq bike
   end

   it "responds to bike" do
     expect(subject).to respond_to :bike
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
