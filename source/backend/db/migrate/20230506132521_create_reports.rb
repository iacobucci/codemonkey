class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.references :to, type: :string, null: false, foreign_key: { to_table: :users, primary_key: :username }
      t.references :from, type: :string, null: false, foreign_key: { to_table: :users, primary_key: :username }
      t.datetime :time
      t.text :description
    end
  end
end
