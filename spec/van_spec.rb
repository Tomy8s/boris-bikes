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
    expect(subject.broken_bike).to eq [bike]
  end

  # Needs to deliver broken bikes to garage

  it 'delivers broken bikes to garage' do
    subject.broken_bike = [double(:bike, broken?: true)]
    garage = Garage.new
    subject.deliver_broken(garage)
    expect(garage.broken_bike).to eq [bike]
  end

end