class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :listing_features, dependent: :destroy
  has_many :features, through: :listing_features
  accepts_nested_attributes_for :listing_features
  has_one_attached :picture

  enum condition: {New: 0, Used: 1, Sealed: 2}
  enum sizes: {Small: 0, Medium: 1, Large: 2, XLarge: 3}
  enum sexes: {Male: 0, Female: 1}


  before_validation :price_to_cents, if: :price_changed?
  before_validation :remove_whitespace

  private
  
  def price_to_cents
    self.price = (self.price * 100).round
  end

  def remove_whitespace # removing whitespace from name and description fields 
    self.title = self.title.strip 
    self.description = self.description.strip
    self.brand = self.brand.strip
    self.color = self.color.strip
  end


end
