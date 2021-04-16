class Book < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :authors

  validates :title, :presence => true, :uniqueness => true
  # El título del libro no puede ser nulo y debe ser único.
  validates :description, :presence => true
  # La descripción del libro no puede ser nula.
  def is_new
    created_at.today? ? "new!" : ""
  end
end
