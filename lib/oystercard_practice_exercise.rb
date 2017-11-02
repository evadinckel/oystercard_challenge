class Oystercard
#for now, this is an empty class.
# Note on classes, my takeways/understanding so far: classes are objects (and objects can interact with each other. We will cover delegation further on). We need to instantiate a class ('create an instance of a class') each time we want to use the object class.


attr_reader :balance, :entry_station, :exit_station, :journeys
#note: attribute readers are like methods. They are attibutes to the class. They are named identically to the class instance variables they share the 'data' with.

#We can also declare constants while in this class. These constants will never change as their name indicate and can be called from outside the class.
MINIMUM_BALANCE = 1




def initialize
  @balance = 0
  @entry_station = nil

end
#We need to initialize the method, with instance variables exposed by our attribute readers. These can change, or vary, as their name indicates.


















end
