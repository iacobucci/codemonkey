class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies, id: false do |t|
      t.string :username, null: false, primary_key: true
      t.string :name
      t.text :bio
      t.binary :propic
      t.string :status
    end
    add_foreign_key :companies, :users, column: :username, primary_key: :username
  end
end
