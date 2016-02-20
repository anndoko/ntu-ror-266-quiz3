class AddGroupsTable < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :group_name

      t.timestamps
    end

    # Create a join table: post_tagship
    create_table :group_users do |t|
      t.integer :group_id
      t.integer :user_id
    end
  end
end
