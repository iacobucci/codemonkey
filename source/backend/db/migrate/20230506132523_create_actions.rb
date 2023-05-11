class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.string :name
      t.references :user, type: :string, null: false
      t.datetime :time
      t.text :description
    end
  end
end
