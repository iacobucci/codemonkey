class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description

      t.datetime :suggestion
      t.datetime :start
      t.datetime :end

      t.float :rating
      t.text :comment

      t.references :codemonkey, type: :string, null: false, foreign_key: { to_table: :codemonkeys, primary_key: :username }
      t.references :company, type: :string, null: false, foreign_key: { to_table: :companies, primary_key: :username }
    end
  end
end
