class Garage

  include BikeContainer

  def fix
    @working_bikes = @broken_bikes
    @broken_bikes = []
  end
end
