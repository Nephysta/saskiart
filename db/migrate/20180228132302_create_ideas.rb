class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.string :category, null: false
      t.string :text, null: false
      t.string :kind
      t.string :gender

      t.timestamps
    end
  end
end
