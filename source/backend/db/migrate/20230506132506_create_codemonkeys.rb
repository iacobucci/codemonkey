class CreateCodemonkeys < ActiveRecord::Migration[7.0]
  def change
    create_table :codemonkeys, id: false do |t|
      t.string :username, null: false, primary_key: true
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.binary :propic
      t.float :rating
      t.string :status
    end
    add_foreign_key :codemonkeys, :users, column: :username, primary_key: :username
  end
end
