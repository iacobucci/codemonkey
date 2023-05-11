class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.string :username, null: false, primary_key: true
      t.string :password_digest
      t.string :email
      t.string :totp_secret

      # STI type column
      t.string :type

      # Codemonkey fields
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.binary :propic
      t.float :rating
      t.string :status

      # Company fields
      t.string :name

      # t.timestamps
    end
  end
end
