class Estate < ApplicationRecord
  
  validates :name, presence: true, length: { minimum: 1, maximum: 128}
  validates :type, presence: true, inclusion: {:in => %w[house department land commercial_ground] }
  validates :street, presence: true, length: { minimum: 1, maximum: 128}
  validates :external_number, presence: true,length: { minimum: 1, maximum: 12 }, format: { with: /\A[A-Za-z0-9-]+\z/ }
  validates :Internal_number, presence: true
  validates :neighborhood, presence: true, length: { minimum: 1, maximum: 128}
  validates :city, presence: true, length: { minimum: 1, maximum: 64}
  validates :country, presence: true, inclusion: { in: ISO3166::Country.all.map(&:alpha2) }
  validates :rooms, presence: true
  validates :bathrooms, presence: true
  validates :comments, presence: true, length: { minimum: 1, maximum: 128}

end
