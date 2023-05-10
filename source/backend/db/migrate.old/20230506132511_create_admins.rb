class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins, id: false do |t|
      t.references :username, type: :string, null: false, foreign_key: { to_table: :users, primary_key: :username }, primary_key: true, column: :username
    end
  end
end
