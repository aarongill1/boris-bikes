require_relative 'Bike'

class DockingStation
  attr_reader :bikes_docked

  def initialize
    @bikes_docked = []
  end

  def release_bike
    fail 'No bikes available' unless @bikes_docked.any?
    @bikes_docked.pop
  end

  def dock(bike)
    fail 'Docking station unavailable' if @bikes_docked.length >= 20
    @bikes_docked << bike
  end
end
