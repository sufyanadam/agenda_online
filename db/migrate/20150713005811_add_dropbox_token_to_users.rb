class AddDropboxTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dropbox_token, :string
    add_column :users, :dropbox_uid, :integer
  end
end
