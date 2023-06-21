class AddAuthorizationToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :premium_member, :boolean, :default => false
  end
end
