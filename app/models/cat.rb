class Cat < ApplicationRecord
  # Validacao
  validates :name, presence: true
  validates :motto, presence: true

  # Relacoes
  belongs_to :owner
  has_many :facts
end