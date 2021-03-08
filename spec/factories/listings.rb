FactoryBot.define do
  factory :listing do
    title { "Nirvana T-Shit" }
    price { 90 }
    sex { "Male" }
    color { "Brown" }
    brand { "Nirvana" }
    description { "Rock and Roll Tee" }
    category { one }
    condition { 1 }
    size { "Large" }
  end
end
