class Hackathon
  attr_accessor :theme
  attr_reader :attendees
  
  def initialize(capacity, theme="Theme")
    @theme = theme
    @capacity = capacity
    @attendees = []
    #needs location, time/date range, organizers
  end

  #add person, depending on type?
  def add_attendee(person)
    unless @attendees.include?(person)
      @attendees << person
    end
    person
  end

  def num_attendees
    @attendees.length
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
