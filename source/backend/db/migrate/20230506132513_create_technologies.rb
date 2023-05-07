class CreateTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :technologies do |t|
      t.string :name
      t.datetime :suggestion
      t.boolean :approved
      t.boolean :refused
    end
  end
end
