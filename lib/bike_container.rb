
# has an array of working bikes

# has an array of broken bikes

# delivers bikes from one array to another

#

#

module BikeContainer

DEFAULT_CAPACITY = 20

  attr_accessor :capacity, :working_bikes, :broken_bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @working_bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def bikes
    @broken_bikes + @working_bikes
  end

  private

  def empty?
    @working_bikes.empty?
  end

  def full?
    bikes.count >= @capacity
  end


end
