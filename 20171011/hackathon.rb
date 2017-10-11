require 'rspec'

class Hackathon
  attr_reader :attendees, :theme
  def initialize(theme, capacity)
    @theme = theme
    @capacity = capacity
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

describe Hackathon do
  # subject { Hackathon.new(10) }
  subject(:hackathon) { Hackathon.new("Testing", 10) }
  # let(:hackathon) { Hackathon.new(10) }

  context "upon initialization" do
    it "should start with 0 attendees" do
      expect(hackathon.attendees).to be_empty
    end

    it "should have a theme" do
      expect(hackathon.theme).to be_a(String)
    end

  end
end
