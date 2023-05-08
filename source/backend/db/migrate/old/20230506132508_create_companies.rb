class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies, id: false do |t|
      t.references :username, type: :string, null: false, foreign_key: { to_table: :users, primary_key: :username }, primary_key: true, column: :username
      t.string :name
      t.text :bio
      t.binary :propic
      t.string :status
    end
  end
end
