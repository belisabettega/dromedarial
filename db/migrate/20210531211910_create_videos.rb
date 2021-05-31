class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :content
      t.text :review
      t.integer :rating
      t.string :status

      t.timestamps
    end
  end
end
