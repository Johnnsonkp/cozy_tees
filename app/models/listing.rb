class Listing < ApplicationRecord
  belongs_to :category

  enum condition: {New: 0, Used: 1, Sealed: 2}
  enum sizes: {Small: 0, Medium: 1, Large: 2, XLarge: 3}
  enum sexes: {Male: 0, Female: 1}
end
