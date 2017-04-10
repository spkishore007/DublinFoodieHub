# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


OrderStatus.delete_all
OrderStatus.create! id: 1, name: "Ordering"
OrderStatus.create! id: 2, name: "Confirmed"
OrderStatus.create! id: 3, name: "Shipping"
OrderStatus.create! id: 4, name: "Deleted"
