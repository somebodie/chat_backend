class ChangeTableReference < ActiveRecord::Migration[5.0]
  def change
    change_table :blogs do |t|
      t.references :user
    end
  end
end
