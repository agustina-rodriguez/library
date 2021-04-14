class Category < ApplicationRecord
  has_many :books

  validates :name, :presence => true, :uniqueness => true
  validates :abbreviation, length: {minimum: 3}, allow_blank: true
  # El mínimo de la abreviación debe ser de 3 caracteres.
  # Se puede dejar en blanco.


  # validates :abbreviation, length: {maximum: 500} -> MAX
  # validates :abbreviation, length: {in: 6..20} -> ENTRE
  # validates: abbreviation, length: {is: 6} -> EXACTO
end
