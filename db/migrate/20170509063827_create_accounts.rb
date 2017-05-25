class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :email
      t.string :number
      t.integer :user_id

      t.timestamps
    end
  end
end
