class CreateCodemonkeysProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :codemonkeys_projects do |t|
      t.references :project, null: false, foreign_key: true
      t.references :codemonkey, type: :string, null: false, foreign_key: { to_table: :codemonkeys, primary_key: :username }
    end
  end
end
