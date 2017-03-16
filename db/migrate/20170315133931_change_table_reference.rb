class ChangeTableReference < ActiveRecord::Migration[5.0]
  def change
    change_table :blogs do |t|
      t.references :user
    end
  end
end

# Still trying to decied if I should tie this to the user or not but works with it as of now
