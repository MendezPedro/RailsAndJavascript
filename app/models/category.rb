class Category < ApplicationRecord
  validates :title, presence: true
  has_many :sub_categories, class_name: "Category", foreign_key: "category_id", dependent: :destroy
  belongs_to :main_category, class_name: "Category", foreign_key: "category_id", optional: true
  has_many :urlmarks
  #se usa para cambiar el valor de public a los hijos
  before_update :change_public

  def change_public
    status = self.public
    self.sub_categories.each do |sc|
      sc.public = status
      sc.save
    end
  end
  scope :name_category, -> (category) { where(:category_id => category)}
end
