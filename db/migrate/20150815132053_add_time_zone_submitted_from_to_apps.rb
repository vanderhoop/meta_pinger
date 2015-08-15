class AddTimeZoneSubmittedFromToApps < ActiveRecord::Migration
  def change
    add_column :apps, :timezone, :string
  end
end
