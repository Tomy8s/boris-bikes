require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity, :bikes, :broken_bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity

  end

  def release_bike
    fail 'No working bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    if bike.broken?
      @broken_bikes << bike
    else
      @bikes << bike
    end
  end

  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count + @broken_bikes.count >= @capacity
  end



end
