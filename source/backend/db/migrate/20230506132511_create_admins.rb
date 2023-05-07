class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins, id: false do |t|
      t.string :username, null: false, primary_key: true
    end
    add_foreign_key :admins, :users, column: :username, primary_key: :username
  end
end
