require_relative 'Bike'

class DockingStation
  attr_reader :bikes_docked
  #attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
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
    fail 'Docking station unavailable' if @bikes_docked.length >= @capacity
  end

  def empty?
    fail 'No bikes available' unless @bikes_docked.any?
  end
end
