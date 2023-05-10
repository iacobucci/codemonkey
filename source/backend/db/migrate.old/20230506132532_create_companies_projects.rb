class CreateCompaniesProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :companies_projects do |t|
      t.references :project, null: false, foreign_key: true
      t.references :company, type: :string, null: false, foreign_key: { to_table: :companies, primary_key: :username }
    end
  end
end
