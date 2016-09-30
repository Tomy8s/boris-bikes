shared_examples_for BikeContainer do
    it 'gives the number of bikes as the total of working and broken bikes' do
      n = rand(20)
      n.times do  bike = double(:bike, broken?: [true,false])
        bike.broken? ? subject.broken_bikes << bike : subject.working_bikes << bike
      end
      expect(subject.bikes.length).to eq n
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end
end
