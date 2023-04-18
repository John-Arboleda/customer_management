class City < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validate :name_format

  has_many :clients, dependent: :nullify

  private
  def name_format
    errors.add(:name, "should start with uppercase") unless name =~ /\A[A-ZÁÉÍÓÚÜ]/
    errors.add(:name, "only allows letters and spaces") unless name =~ /\A[a-záéíóúüA-ZÁÉÍÓÚÜ\s]*\z/
  end
end
