class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description

      t.datetime :suggestion_time
      t.datetime :start_time
      t.datetime :end_time

      t.float :rating
      t.text :comment

      t.string :status

      t.references :codemonkey, type: :string, null: false, foreign_key: { to_table: :users, primary_key: :username }
      t.references :company, type: :string, null: false, foreign_key: { to_table: :users, primary_key: :username }
    end
  end
end
