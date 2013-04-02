class RemoveStatusColumn < ActiveRecord::Migration
  def up
    remove_column :events, :status
  end

  def down
  end
end
