class CreateTypeFormats < ActiveRecord::Migration[5.2]
  def change
    create_table :type_formats do |t|
      t.string :title

      t.timestamps
    end
  end
end
