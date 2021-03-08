require 'rails_helper'

RSpec.describe "listings/show", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      title: "Title",
      price: 2,
      sex: "Sex",
      color: "Color",
      brand: "Brand",
      description: "MyText",
      category: nil,
      condition: 3,
      size: "Size"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Sex/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Size/)
  end
end
