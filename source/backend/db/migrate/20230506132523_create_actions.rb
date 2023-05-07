class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.string :user, null: false
      t.datetime :date
      t.text :description
    end
    add_foreign_key :actions, :users, column: :user, primary_key: :username
  end
end
