require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }

  it 'fails if bike broken' do
    bike = double(:bike)
    allow(bike).to receive(:broken?).and_return(true)
    subject.dock(bike)
    expect {subject.release_bike}.to raise_error 'No working bikes available'
  end


  it 'returns docked bikes' do
    bike = double(:bike, broken?: false, working?: true)
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end

  let(:bike) { double :bike }
  it 'releases working bikes' do
    allow(bike).to receive(:working?).and_return(true)
    allow(bike).to receive(:broken?).and_return(false)
    subject.dock(bike)
    released_bike = subject.release_bike
    expect(released_bike).to be_working
  end

  describe 'initialization' do
    subject {DockingStation.new}
    let(:bike) { double(:bike, broken?: false) }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = double(:bike)
      allow(bike).to receive(:broken?).and_return(false)
      subject.dock(bike)
      # We want to release the bike we docked
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when there are no bikes available' do
      expect {subject.release_bike}.to raise_error 'No working bikes available'
    end


  end

  describe 'dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock double(:bike, broken?: [true, false]) }
      expect { subject.dock double(:bike) }.to raise_error 'Docking station full'
    end
    end





end
