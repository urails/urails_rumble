class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.string :email

      t.timestamps
    end
  end
end
