class CreateChains < ActiveRecord::Migration
  def up
    create_table :chains do |t|
      t.datetime :start_date
      t.string :link_rate
      t.string :title
      t.string :end_type
      t.integer :num_left
      t.timestamps
    end
  end
  def down
    drop_table :chains
  end
end
