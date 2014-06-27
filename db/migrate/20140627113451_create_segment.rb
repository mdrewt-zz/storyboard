class CreateSegment < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.references :user, :story
      t.integer :parent_id
      t.text :body

      t.timestamps
    end
  end
end
