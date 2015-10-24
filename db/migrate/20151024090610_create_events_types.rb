class CreateEventsTypes < ActiveRecord::Migration
  def change
    create_table :events_types do |t|
      t.references :event, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
