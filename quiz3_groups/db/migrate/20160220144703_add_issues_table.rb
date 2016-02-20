class AddIssuesTable < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :issue_topic
      t.text :description

      t.timestamps
    end
  end
end
