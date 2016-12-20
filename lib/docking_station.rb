require_relative 'bike'
require_relative 'bike_container'

class DockingStation

  include BikeContainer

  DEFAULT_CAPACITY = 20

  def release_bike
    fail 'No working bikes available' if empty?
    @working_bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    if bike.broken?
      @broken_bikes << bike
    else
      @working_bikes << bike
    end
  end


end
