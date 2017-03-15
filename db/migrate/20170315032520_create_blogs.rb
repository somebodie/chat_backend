class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.string :author
      t.string :media
      t.date :created_at
      t.date :updated_at

      t.timestamps
    end
  end
end
