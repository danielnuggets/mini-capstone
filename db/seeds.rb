# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
product = Product.new(name: "Magic Markers", price: 8, image: "http://www.independentliving.com/images/675629.JPG", description: "markers that will enrich your life")
product.save
product = Product.new(name: "Tamagotchi", price: 30, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Tamagotchi_0124_ubt.jpeg/220px-Tamagotchi_0124_ubt.jpeg", description: "The best pet ever")
product.save
product = Product.new(name: "Ring Pop", price: 3, image: "http://www.chicagonow.com/cheaper-than-therapy/files/2013/01/Blue-Raspberry-Pop.png", description: "The perfect engagement ring")
product.save
product = Product.new(name: "Snow Shoes", price: 50, image: "https://cdni.llbean.net/is/image/wim/253594_2971_41", description: "The Alaskan's best friend")
product.save
product = Product.new(name: "Batman Cape", price: 100, image: "http://superstuffandslaves.weebly.com/uploads/1/3/4/8/13487044/s882667997167022802_p1_i1_w1155.jpeg", description: "For fighting crime")
product.save