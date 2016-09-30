require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity, :working_bikes, :broken_bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @working_bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

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

  private

  def empty?
    @working_bikes.empty?
  end

  def full?
    @working_bikes.count + @broken_bikes.count >= @capacity
  end
end