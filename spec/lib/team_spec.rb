require './lib/team'

describe Team do
  describe "#initialize" do
    context "when the number of people specified is greater than 0" do
      it "creates a team with that number of people" do
        team = Team.new(3)
        expect(team.num_people).to eq 3
      end
      it "sets the total markup" do
        stub_const("Team::MARKUP_PER_PERSON", 1.2)
        team = Team.new(3)
        expect(team.markup).to be_within(0.0001).of(3.6)
      end
    end

    context "when the number of people specified is not greater than 0" do
      it "raises an ArgumentError" do
        expect { Team.new(-1) }.to raise_error(ArgumentError, "Argument must be greater than 0")
      end
    end

    context "when the number of people is not specified" do
      it "raises an ArgumentError" do
        expect { Team.new() }.to raise_error(ArgumentError)
      end
    end

    context "when the parameter is not a number" do
      it "raises an ArgumentError" do
        expect { Team.new('3') }.to raise_error(ArgumentError, "Expected integer argument")
      end
    end
  end
end