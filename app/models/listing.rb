class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :listing_features, dependent: :destroy
  has_many :features, through: :listing_features
  accepts_nested_attributes_for :listing_features

  enum condition: {New: 0, Used: 1, Sealed: 2}
  enum sizes: {Small: 0, Medium: 1, Large: 2, XLarge: 3}
  enum sexes: {Male: 0, Female: 1}
  
end
