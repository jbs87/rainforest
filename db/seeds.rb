User.destroy_all
Product.destroy_all

User.create!({
  email: "example@bitmakerlabs.com",
  name: "Example User",
  password: "pass",
  password_confirmation: "pass"
  }
)

100.times do |i|

Product.create({
  name: "Product#{i}",
  description: "Description#{i}",
  price_in_cents: i
  }
)
end