class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :country
      t.string :area
      t.string :comment
      t.string :place
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
