require_relative 'docking_station'

class Van

  attr_accessor :broken_bikes

  def initialize
    @broken_bikes = []
  end

  def pick_up(station)
    if station.broken_bikes.count >= 0
      @broken_bikes = station.broken_bikes
      station.broken_bikes = []
    end
  end

  def deliver_broken(garage)
    garage.broken_bikes = @broken_bikes
    @broken_bikes = []
  end



end
