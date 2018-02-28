class CreateIdeaPictures < ActiveRecord::Migration[5.1]
  def change
    create_table :idea_pictures do |t|
      t.references :idea, foreign_key: true
      t.references :picture, foreign_key: true

      t.timestamps
    end
  end
end
