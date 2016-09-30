require_relative 'docking_station'

class Van

attr_accessor :cargo

def initialize
  @cargo = []
end

def pick_up(station)
  if station.broken_bikes.count >= 0
    @cargo = station.broken_bikes
    station.broken_bikes = []
  end
end

end
