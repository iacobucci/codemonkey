class CreateTechnologiesUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :technologies_users do |t|
      t.references :user, type: :string, null: false, foreign_key: { to_table: :users, primary_key: :username }
      t.references :technology, null: false, foreign_key: true
    end
  end
end
