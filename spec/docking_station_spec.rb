require 'docking_station'


describe DockingStation do
    #it { is_expected.to respond_to :release_bike }
    describe '#release_bike' do

      it 'releases a bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end
    end


    it "can we check if bke is working?" do
      bike = Bike.new
      expect(bike.working?).to eq(true)
    end

    it "docks a bike" do
      bike = Bike.new
      expect(subject.dock(bike)).to eq(bike)
    end


    it "returns docked bikes" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq(bike)
    end






end
