class CreateTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :technologies do |t|
      t.string :name
      t.datetime :suggestion_time
      t.boolean :approved
      t.boolean :rejected
    end
  end
end
