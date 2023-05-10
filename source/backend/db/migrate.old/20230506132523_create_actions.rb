class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.references :user, type: :string, null: false
      t.datetime :date
      t.text :description
    end
  end
end
