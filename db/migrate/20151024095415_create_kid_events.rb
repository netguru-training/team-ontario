class CreateKidEvents < ActiveRecord::Migration
  def change
    create_table :kid_events do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
    end
  end
end
