class Client < ApplicationRecord
  validates :name, presence: true
  validate :name_format

  belongs_to :city

  private
  def name_format
    errors.add(:name, "should start with uppercase") unless name =~ /\A[A-ZÁÉÍÓÚÜ]/
    errors.add(:name, "only allows letters and spaces") unless name =~ /\A[a-záéíóúüA-ZÁÉÍÓÚÜ\s]*\z/
  end
end
