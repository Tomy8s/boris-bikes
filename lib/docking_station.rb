require_relative 'bike'

class DockingStation
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize
    @capacity = DEFAULT_CAPACITY
    @bikes = []
  end

  def release_bike
    fail 'No bike available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking Station Full' if full?
    @bikes << bike
  end

  #attr_reader :bike
  #def bike
  #  @bike
  #end

  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count >= @capacity
  end
end
