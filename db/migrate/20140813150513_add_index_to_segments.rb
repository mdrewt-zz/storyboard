class AddIndexToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :index, :integer
  end
end
