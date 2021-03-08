require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        title: "Title",
        price: 2,
        sex: "Sex",
        color: "Color",
        brand: "Brand",
        description: "MyText",
        category: nil,
        condition: 3,
        size: "Size"
      ),
      Listing.create!(
        title: "Title",
        price: 2,
        sex: "Sex",
        color: "Color",
        brand: "Brand",
        description: "MyText",
        category: nil,
        condition: 3,
        size: "Size"
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Sex".to_s, count: 2
    assert_select "tr>td", text: "Color".to_s, count: 2
    assert_select "tr>td", text: "Brand".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Size".to_s, count: 2
  end
end
