class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.string :username, null: false, primary_key: true
      t.string :password_digest
      t.string :email
      t.string :kind
      t.string :totp_secret
    end
  end
end
