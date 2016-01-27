require './lib/nupack'

describe NuPack do
  describe "#calc_price" do

    before :each do
      @nupack = NuPack.new
    end

    context "receives a non-numeric base price" do
      it "raises an ArgumentError" do
        base_price = "1299.99"
        team = Team.new(1)
        package = Package.new("books")

        expect { @nupack.calc_price(base_price, team, package) }.to raise_error(ArgumentError, "expected numeric first argument")
      end
    end
    context "receives a team argument that is not of type Team" do
      it "raises an ArgumentError" do
        base_price = 1299.99
        team = 3
        package = Package.new("books")

        expect { @nupack.calc_price(base_price, team, package) }.to raise_error(ArgumentError, "expected second argument of type Team")
      end
    end
    context "receives a package argument that is not of type Package" do
      it "raises an ArgumentError" do
        base_price = 1299.99
        team = Team.new(1)
        package = "books"

        expect { @nupack.calc_price(base_price, team, package) }.to raise_error(ArgumentError, "expected third argument of type Package")
      end
    end
    context "receives a numeric, Team, and Package parameters" do
      context "with 1 team member" do
        it "calculates the final price after markup with a package of kindles" do
          stub_const("Team::MARKUP_PER_PERSON", 0.012)
          stub_const("NuPack::FLAT_MARKUP", 0.05)

          base_price = 100.00
          team = Team.new(1)
          package = Package.new("kindles")

          price = @nupack.calc_price(base_price, team, package)
          expect(price).to be_within(0.01).of(106.26)
        end
        it "calculates the final price after markup with a package of drugs" do
          stub_const("Team::MARKUP_PER_PERSON", 0.012)
          stub_const("Project::DRUGS_MARKUP", 0.075)
          stub_const("NuPack::FLAT_MARKUP", 0.05)

          base_price = 5432.00
          team = Team.new(1)
          package = Package.new("drugs")

          price = @nupack.calc_price(base_price, team, package)
          expect(price).to be_within(0.01).of(6199.81)
        end
      end
      context "with multiple team members" do
        it "calculates the final price after markup with a package of books" do
          stub_const("Team::MARKUP_PER_PERSON", 0.012)
          stub_const("NuPack::FLAT_MARKUP", 0.05)

          base_price = 12456.95
          team = Team.new(4)
          package = Package.new("books")

          price = @nupack.calc_price(base_price, team, package)
          expect(price).to be_within(0.01).of(13707.63)
        end
        it "calculates the final price after markup with package of food" do
          stub_const("Team::MARKUP_PER_PERSON", 0.012)
          stub_const("Project::FOOD_MARKUP", 0.13)
          stub_const("NuPack::FLAT_MARKUP", 0.05)

          base_price = 1299.99
          team = Team.new(3)
          package = Package.new("food")

          price = @nupack.calc_price(base_price, team, package)
          expect(price).to be_within(0.01).of(1591.58)
        end
        it "calculates the final price after markup with package of electronics" do
          stub_const("Team::MARKUP_PER_PERSON", 0.012)
          stub_const("Project::ELECTRONICS_MARKUP", 0.02)
          stub_const("NuPack::FLAT_MARKUP", 0.05)

          base_price = 1299.99
          team = Team.new(3)
          package = Package.new("electronics")

          price = @nupack.calc_price(base_price, team, package)
          expect(price).to be_within(0.01).of(1441.43)
        end
      end
    end
  end
end