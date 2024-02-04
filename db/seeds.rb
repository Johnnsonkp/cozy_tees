# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = ['All Tees', 'Retro Tees', 'Jerseys']
features = ['Vintage', 'Authentic', 'Exclusive', 'Collectable']

if Category.count == 0
    categories.each do |category|
        Category.create(name: category)
        puts "created #{category} category"
    end
end

if Feature.count == 0
    features.each do |feature|
        Feature.create(name: feature)
        puts "created #{feature} feature"
    end
end

# if Listing.count == 0 
#     Listing.create([{title: 'Testing Ts'}, {price: 10}, {sex: 'male'}, {color: 'black'}, {brand: 'nike'}, {description: 'This is a testing t-shirt'}, {category_id: 1}, {condition: 1}, {size: 'small'}, {user_id: 1}])
# end

# create_table "listings", force: :cascade do |t|
#     t.string "title"
#     t.integer "price"
#     t.string "sex"
#     t.string "color"
#     t.string "brand"
#     t.text "description"
#     t.bigint "category_id", null: false
#     t.integer "condition"
#     t.string "size"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.bigint "user_id", null: false
#     t.boolean "purchased", default: false
#     t.index ["category_id"], name: "index_listings_on_category_id"
#     t.index ["user_id"], name: "index_listings_on_user_id"
#   end


