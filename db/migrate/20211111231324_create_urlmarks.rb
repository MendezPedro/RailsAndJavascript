class CreateUrlmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :urlmarks do |t|
      t.string :url
      t.references :category, foreign_key: true
      t.references :type_format, foreign_key: true

      t.timestamps
    end
  end
end
