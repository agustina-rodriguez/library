# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.delete_all
Book.delete_all
Category.delete_all
#Primero borramos todo lo que tenemos registrado en la bdd.

Author.populate 10 do | a |
  a.first_name = Faker::Name.first_name
  a.last_name = Faker::Name.last_name
  #Le pido 5 autores, con sus atributos
end

Category.populate 20 do | c |
  c.name = Faker::Book.genre
  #Por cada categoría (en total 20) voy a agregar 2 libros:

  Book.populate 2 do | b |
    b.title = Faker::Book.title
    b.category_id = c.id
  end
end

Book.all.each do | b |
  # b.authors = Author.all.limit(2)
  b.authors = Author.all.limit(10)
  b.save
end
