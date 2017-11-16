require_relative 'hackathon'

describe Hackathon do
  # subject { Hackathon.new(10) }
  subject(:hackathon) { Hackathon.new(10) }
  # let(:hackathon) { Hackathon.new(10) }
  # let(:person1) { double("anastassia") }
  # let(:person2) { double("isak") }

  context "initialization" do
    it "should start with 0 attendees" do
      expect(hackathon.attendees).to be_empty
    end

    it "should have a theme" do
      expect(hackathon.theme).to be_a(String)
    end

  end

  context "modification" do
    it "can modify the theme" do
      hackathon.theme = "Machine Learning"
      expect(hackathon.theme).to eq("Machine Learning")
    end
  end
end
