class City < ApplicationRecord
  validates :name, presence: true, uniqueness: true, format: { with: /\A[A-ZÁÉÍÓÚÜ][a-záéíóúüA-ZÁÉÍÓÚÜ\s]*\z/, message: "only allows letters and spaces" }

  has_many :clients
end
