class Owner < ApplicationRecord
  # Validacao
  validates :name, presence: true

  # Relacoes
  has_one :address
  has_many :cats
end