require_relative 'Bike'

class DockingStation
  attr_reader :bikes_docked

  def initialize
    @bikes_docked = []
  end

  def release_bike
    empty?
    @bikes_docked.pop
  end

  def dock(bike)
    full?
    @bikes_docked << bike
  end

  private
  def full?
    fail 'Docking station unavailable' if @bikes_docked.length >= 20
  end

  def empty?
    fail 'No bikes available' unless @bikes_docked.any?
  end
end
