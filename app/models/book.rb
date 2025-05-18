class Book < ApplicationRecord
  has_many :characters, dependent: :destroy
  has_many :settings, dependent: :destroy
  has_one :worldbuilding, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :cover_url, presence: true, format: { with: URI::regexp(%w[http https]), message: 'must be a valid URL' }
  validates :progress, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
