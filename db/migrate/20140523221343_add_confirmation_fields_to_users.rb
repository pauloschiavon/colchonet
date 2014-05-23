class AddConfirmationFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_token, :string
  end
  
  #change_table :users do |t|
  #  t.datetime :confirmed_at
  #  t.string :confirmation_token
  #end
end

