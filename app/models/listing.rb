class Listing < ApplicationRecord
  belongs_to :category
  
  enum conditions: {New: 0, Used: 1, Sealed: 2}
end
