class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :events_type, index: true, foreign_key: true
    remove_column :events_types, :event_id
  end
end
