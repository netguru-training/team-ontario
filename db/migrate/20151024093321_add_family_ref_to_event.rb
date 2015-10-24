class AddFamilyRefToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :family, index: true, foreign_key: true
  end
end
