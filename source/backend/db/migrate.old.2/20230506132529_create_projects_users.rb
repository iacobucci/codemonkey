class CreateProjectsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :projects_users do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, type: :string, null: false, foreign_key: { to_table: :users, primary_key: :username }
    end
  end
end
