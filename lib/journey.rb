class Journey
attr_accessor :entry_station, :exit_station

def initialize
  @entry_station = nil
  @exit_station = nil
end

def entry_station(station)
  @entry_station = station
end

def exit_station(station)
  @exit_station = station
end

def current
  { entry: @entry_station , exit: @exit_station }
end

def complete
  @entry_station = nil
  @exit_station = nil
end
end
