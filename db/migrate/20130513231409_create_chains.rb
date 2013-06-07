class CreateChains < ActiveRecord::Migration
  def up
    create_table :chains do |t|
      t.datetime :start_date
      t.string :link_rate
      t.integer :num_links
      t.string :title
      t.string :end_time
      t.integer :num_total
      t.timestamps
    end
  end
  def down
    drop_table :chains
  end
end
