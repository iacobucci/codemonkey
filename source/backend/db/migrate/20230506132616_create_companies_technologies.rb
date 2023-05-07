class CreateCompaniesTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies_technologies do |t|
      t.references :technology, null: false, foreign_key: true
      t.references :company, type: :string, null: false, foreign_key: { to_table: :companies, primary_key: :username }
    end
  end
end
