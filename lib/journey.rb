class Journey
attr_accessor :entry_station, :exit_station

def initialize
  @entry_station = nil
  @exit_station = nil
end

def entry_station(station)
  @entry_station = station
end

def get_station
  @entry_station
end
end
