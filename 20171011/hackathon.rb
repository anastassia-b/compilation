require 'rspec'

class Hackathon
  attr_reader :num_attendees
  def initialize(capacity)
    @capacity = capacity
    @num_attendees = 0
    @attendees = []
  end
end

class Person
  def initialize(name)
    @name = name
  end
end

class Attendee < Person
  def initialize(name)
    super(name)
  end
end
