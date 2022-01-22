class ChangeOverviewToBeTextInMovie < ActiveRecord::Migration[6.1]
  def up
    change_column :movies, :overview, :text
  end

  def down
    change_column :movies, :overview, :string
  end
end
