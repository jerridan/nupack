require './lib/package'

describe Package do
  describe "#initialize" do
    context "when a package type is specified" do
      context "package type argument is a string" do
        it "creates a package with that type" do
          package = Package.new("food")
          expect(package.type).to eq "food"
        end
        context "package does not contain food, drugs, or electonics" do
          it "sets a markup of 0" do
            package = Package.new("books")
            expect(package.markup).to eq 0
          end
        end
        context "package contains food" do
          it "sets the appropriate food markup" do
            stub_const("Package::FOOD_MARKUP", 0.13)
            package = Package.new("food")
            expect(package.markup).to eq 0.13
          end
        end
        context "package contains drugs" do
          it "sets the appropriate drugs markup" do
            stub_const("Package::DRUGS_MARKUP", 0.075)
            package = Package.new("drugs")
            expect(package.markup).to eq 0.075
          end
        end
        context "package contains electronics" do
          it "sets the appropriate electronics markup" do
            stub_const("Package::ELECTRONICS_MARKUP", 0.2)
            package = Package.new("electronics")
            expect(package.markup).to eq 0.2
          end
        end
      end
      context "package type is not a string" do
        it "raises an ArgumentError" do
          expect { Package.new(7) }.to raise_error(ArgumentError, "expected string argument")
        end
      end
    end
    context "when no package type is specified" do
      it "raises an ArgumentError" do
        expect { Package.new() }.to raise_error(ArgumentError)
      end
    end
  end
end