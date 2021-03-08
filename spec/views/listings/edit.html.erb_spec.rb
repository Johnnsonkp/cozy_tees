require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      title: "MyString",
      price: 1,
      sex: "MyString",
      color: "MyString",
      brand: "MyString",
      description: "MyText",
      category: nil,
      condition: 1,
      size: "MyString"
    ))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

      assert_select "input[name=?]", "listing[title]"

      assert_select "input[name=?]", "listing[price]"

      assert_select "input[name=?]", "listing[sex]"

      assert_select "input[name=?]", "listing[color]"

      assert_select "input[name=?]", "listing[brand]"

      assert_select "textarea[name=?]", "listing[description]"

      assert_select "input[name=?]", "listing[category_id]"

      assert_select "input[name=?]", "listing[condition]"

      assert_select "input[name=?]", "listing[size]"
    end
  end
end
