class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :image
      t.references :user, forenign_key: true
      t.references :category, forenign_key: true
      t.timestamps
    end
  end
end
