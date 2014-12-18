class AddProfileNameAndProfileIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_name, :string, :default => "beamer"
    add_column :users, :profile_id, :string, :unique => true
    change_column :users, :profile_id, :string, :unique => true, null: false
  	
  end
end
