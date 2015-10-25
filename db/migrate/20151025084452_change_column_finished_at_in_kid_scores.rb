class ChangeColumnFinishedAtInKidScores < ActiveRecord::Migration
  def change
    change_column :kid_scores, :finished_at, :datetime
  end
end
