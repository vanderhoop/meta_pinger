class AddIndexToProjectName < ActiveRecord::Migration
  def change
    add_index :apps, :project_name
  end
end
