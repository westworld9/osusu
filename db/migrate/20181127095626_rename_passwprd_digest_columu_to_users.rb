class RenamePasswprdDigestColumuToUsers < ActiveRecord::Migration[5.1]
  def change 
    rename_column :users, :passwprd_digest, :password_digest
  end
end
