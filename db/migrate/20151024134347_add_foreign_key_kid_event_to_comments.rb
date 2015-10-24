class AddForeignKeyKidEventToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :kid_event, index: true, foreign_key: true
    add_timestamps(:kid_events)
  end
end
