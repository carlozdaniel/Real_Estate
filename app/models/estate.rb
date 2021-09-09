class Estate < ApplicationRecord
  self.inheritance_column = :_type_disabled
  validates :name, presence: true, length: { minimum: 1, maximum: 128}
  validates :type, presence: true, inclusion: {:in => %w[house department land commercial_ground] }
  validates :street, presence: true, length: { minimum: 1, maximum: 128}
  validates :external_number, presence: true,length: { minimum: 1, maximum: 12 }, format: { with: /\A[A-Za-z0-9-]+\z/ }
  validates :Internal_number, presence: true, format: { with: /\A[A-Za-z0-9\s-]+\z/ }
  validates :neighborhood, presence: true, length: { minimum: 1, maximum: 128}
  validates :city, presence: true, length: { minimum: 1, maximum: 64}
  validates :country, presence: true, length: { minimum: 2, maximum: 2}, inclusion: { in: ISO3166::Country.all.map(&:alpha2) }
  validates :rooms, presence: true
  validates :bathrooms, presence: true
  validates :comments, presence: true, length: { minimum: 1, maximum: 128}

end
