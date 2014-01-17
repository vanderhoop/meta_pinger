class CreateAppTable < ActiveRecord::Migration
  def change
      create_table :apps do |t|
        t.string :url
        t.string :project_name
        t.timestamps
      end
  end
end
