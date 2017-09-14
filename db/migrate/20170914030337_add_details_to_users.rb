class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :access_token, :string
    add_column :users, :token_type, :string
    add_column :users, :expires_in, :string
    add_column :users, :state, :string
  end
end
