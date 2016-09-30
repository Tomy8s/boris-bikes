require_relative 'docking_station'

class Van

  attr_accessor :broken_bikes, :working_bikes

  def initialize
    @broken_bikes = []
    @working_bikes = []
  end

  def pick_up(station)
    if station.broken_bikes.count >= 0
      if station.class == DockingStation
        @broken_bikes = station.broken_bikes
        station.broken_bikes = []
      else
        @working_bikes = station.working_bikes
        station.working_bikes = []
      end
    end
  end

  def deliver_broken(garage)
    garage.broken_bikes = @broken_bikes
    @broken_bikes = []
  end

  def deliver_working(station)
    station.working_bikes = @working_bikes
    @working_bikes = []
  end
end
