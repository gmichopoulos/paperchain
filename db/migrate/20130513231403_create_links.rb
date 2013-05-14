class CreateLinks < ActiveRecord::Migration
  def up
    create_table :links do |t|
      t.datetime :date
      t.text :link_text
      t.timestamps
    end
  end
  def down
    drop_table :links
  end
end
