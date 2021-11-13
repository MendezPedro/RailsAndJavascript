class Urlmark < ApplicationRecord
  validates :url, presence: true

  belongs_to :category
  belongs_to :type_format
end
