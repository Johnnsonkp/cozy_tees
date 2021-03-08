require 'rails_helper'

# RSpec.describe "Listing Factory" do
#   it "is valid" do
#     expect(build(:listing)).to be_valid
#   end
# end


RSpec.describe "Listing Factory" do 
  context "testing properties" do 
      before(:all) do 
          @listing = build(:listing)
      end

      it "has the right title" do 
          expect(@listing.title).to eq "Nirvana T-Shit"
      end

      it "has the right price" do 
          expect(@listing.price).to eq 90
      end

      it "has the right sex" do 
        expect(@listing.sex).to eq "Male"
      end

      it "has the right color" do 
        expect(@listing.color).to eq "Brown"
      end

      it "has the right brand" do 
        expect(@listing.brand).to eq "Nirvana"
      end

      it "has the right description" do 
        expect(@listing.description).to eq "Rock and Roll Tee"
      end

      it "has the right condition" do 
        expect(@listing.condition).to eq(1)
      end

      it "has the right size" do 
        expect(@listing.size).to eq "Large"
      end


  end 
end