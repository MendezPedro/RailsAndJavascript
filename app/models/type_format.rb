class TypeFormat < ApplicationRecord
    validates :title, presence: true
    has_many :urlmarks
end
