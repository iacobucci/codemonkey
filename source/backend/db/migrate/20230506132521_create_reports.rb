class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :from
      t.string :to
      t.datetime :date
      t.text :description
    end
    add_foreign_key :reports, :users, column: :from, primary_key: :username
    add_foreign_key :reports, :users, column: :to, primary_key: :username
  end
end
