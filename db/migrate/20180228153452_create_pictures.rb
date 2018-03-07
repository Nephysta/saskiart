class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :data, null: false

      t.timestamps
    end
  end
end
