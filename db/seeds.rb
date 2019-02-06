# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cpu = Category.find_or_create_by(title: "CPUs")
mb = Category.find_or_create_by(title: "Motherboards")
mem = Category.find_or_create_by(title: "Memory")
storage = Category.find_or_create_by(title: "Storage")
video = Category.find_or_create_by(title: "Video Cards")

Product.create(name: "Intel i7", price: 500, category: cpu)
Product.create(name: "Intel i5", price: 300, category: cpu)
Product.create(name: "Intel i3", price: 200, category: cpu)
Product.create(name: "Corsair", price: 100, category: mem)
Product.create(name: "G.Skill", price: 100, category: mem)
Product.create(name: "SSD", price: 100, category: storage)
Product.create(name: "HDD", price: 50, category: storage)
Product.create(name: "GeForce", price: 800, category: video)
Product.create(name: "GeForce 2", price: 500, category: video)
