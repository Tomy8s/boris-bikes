require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases working bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument}

  #it { is_expected.to respond_to(:bike) }

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)[-1]).to eq bike
  end

  describe '#dock' do

    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when full' do
      20.times{ subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking Station Full'
    end

  end

  describe '#release_bike' do

      it 'raises an error when empty' do
        expect { subject.release_bike }.to raise_error 'No bike available'
      end


    end
end
