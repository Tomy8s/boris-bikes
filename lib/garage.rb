class Garage
  attr_accessor :broken_bikes, :working_bikes

  def initialize
    @broken_bikes = []
    @working_bikes = []
  end

  def fix
    @working_bikes = @broken_bikes
    @broken_bikes = []
  end
end
