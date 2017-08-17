# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

Ingredient.destroy_all

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
html = open(url).read
raw_ingredients = JSON.parse(html)
ingredients = raw_ingredients['drinks']
# don't need to access an index from the drinks array too as want access to all hash key value pairs

ingredients.each do |i|
  Ingredient.create(name: i['strIngredient1'])
end
