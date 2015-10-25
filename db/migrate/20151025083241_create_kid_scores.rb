class CreateKidScores < ActiveRecord::Migration
  def change
    create_table :kid_scores do |t|
      t.string :name
      t.integer :score
      t.date :finished_at
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
