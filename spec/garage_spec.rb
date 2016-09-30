require 'docking_station'
require 'bike'
require 'van'
require 'garage'

describe Garage do

  it 'fixes bikes' do
    van = Van.new
    bike = double(:bike, broken?: true)
    van.broken_bikes = [bike]
    van.deliver_broken(subject)
    subject.fix
    expect(subject.working_bikes).to eq [bike]
  end


end
