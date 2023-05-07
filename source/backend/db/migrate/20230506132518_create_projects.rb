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

      t.string :codemonkey
      t.string :company
    end

    add_foreign_key :projects, :codemonkeys, column: :codemonkey, primary_key: :username
    add_foreign_key :projects, :companies, column: :company, primary_key: :username
  end
end
