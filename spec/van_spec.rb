require 'docking_station'
require 'bike'
require 'garage'
require 'van'

describe Van do

  # Needs to pick up broken bikes from docking station

  it 'picks up broken bikes' do
    bike = Bike.new
    bike.report_broken
    station = DockingStation.new
    station.dock(bike)
    subject.pick_up(station)
    expect(subject.broken_bikes).to eq [bike]
  end

  # Needs to deliver broken bikes to garage

  it 'delivers broken bikes to garage' do
    bike = double(:bike, broken?: true)
    subject.broken_bikes = [bike]
    garage = Garage.new
    subject.deliver_broken(garage)
    expect(garage.broken_bikes).to eq [bike]
  end

  it 'picks up fixed bikes' do
    bike = double(:bike, broken?: false)
    garage = Garage.new
    garage.working_bikes = [bike]
    subject.pick_up(garage)
    expect(subject.working_bikes).to eq [bike]

  end


  it 'returns fixed bikes' do

  end


end
