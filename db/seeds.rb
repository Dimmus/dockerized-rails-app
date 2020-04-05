# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb
# Shelf.delete_all
# Book.delete_all
books=Book.create([
    {title: 'book1', author: 'author1'},
    {title: 'book2', author: 'author1'},
    {title: 'book3', author: 'author1'},
    {title: 'book4', author: 'author2'},
    {title: 'book5', author: 'author3'},
])