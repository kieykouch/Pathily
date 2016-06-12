class AddUsernameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    # this is one to one relationship
    add_column :users, :weekly, :boolean, :default => false # for weely job alert
    add_column :users, :daily, :boolean, :default => false # for daily job alert
  end
end
