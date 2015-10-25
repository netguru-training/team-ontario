class AddDoneColumnToKidEvent < ActiveRecord::Migration
  def change
    add_column :kid_events, :done, :boolean, default: false
  end
end
