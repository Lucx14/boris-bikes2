require 'docking_station'

describe DockingStation do
    let(:mockBike) { double :bike }

    describe "initialization" do
      it "@bikes - returns the instance variable @bikes" do
        subject.dock(mockBike)
        expect(subject.bikes).to eq([mockBike])
      end
      it "@capacity - has a readable default capacity" do
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
      end
    end

    describe '#release_bike' do
      it '.release_bike - does it create a bike object' do
        allow(mockBike).to receive(:working?).and_return(true)
        subject.dock(mockBike)
        expect(subject.release_bike).to eq(mockBike)
      end
      it '.release_bike - error when no bikes available' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end
        it ".release_bike - releases working bikes" do
          allow(mockBike).to receive(:working?).and_return(true)
          subject.dock(mockBike)
          expect(subject.release_bike).to be_working
        # expect(subject.release_bike).to be(bike) - is this possible or necessary??
        end
        it '.release_bike - does not release broken bikes' do
          allow(mockBike).to receive(:working?).and_return(false)
          subject.dock(mockBike)
          expect { subject.release_bike }.to raise_error "No bikes available"
        end
    end

    #Nested describe block focused on the dock method
    describe '#dock(bike)' do
      it ".dock(bike) returns a bike object in an array" do
        expect(subject.dock(mockBike)).to eq([mockBike])
      end
      it '.dock(bike) - error when docking station is full' do
        DockingStation::DEFAULT_CAPACITY.times{ subject.dock(mockBike) }
        expect{ subject.dock(mockBike) }.to raise_error 'Docking Station Full!!!'
      end
    end
end
