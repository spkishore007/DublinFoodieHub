# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#StoreDetail.destroy_all
#StoreDetail.create! id: 1, store_name: "US Polo", building: "USA", street: "364 sdhs", city: "CA", pincode: "3278378"
#StoreDetail.create! id: 2, store_name: "US Polo fav", building: "USA", street: "364 sdhs", city: "CA", pincode: "3278378"

#Product.delete_all
#Product.create! id: 1, name: "Banana", price: 0.49, active: true,store_detail_id: 1
#Product.create! id: 2, name: "Apple", price: 0.29, active: true,store_detail_id: 2
#Product.create! id: 3, name: "Carton of Strawberries", price: 1.99, active: true,store_detail_id:

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
