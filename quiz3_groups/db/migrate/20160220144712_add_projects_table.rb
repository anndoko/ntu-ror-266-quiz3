class AddProjectsTable < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.text :description
      
      t.timestamps
    end

    add_column :issues, :project_id, :integer
  end
end
