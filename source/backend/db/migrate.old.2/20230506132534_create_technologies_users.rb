class CreateTechnologiesUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :technologies_users do |t|
      t.references :technology, null: false, foreign_key: true
      t.references :users, type: :string, null: false
    end
  end
end
