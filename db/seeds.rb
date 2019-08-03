10.times do |i|
  Category.create(name: "category##{i}")
end

Category.create(name: "other", key_name: "other")