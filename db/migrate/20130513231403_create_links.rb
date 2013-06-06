class CreateLinks < ActiveRecord::Migration
  def up
    create_table :links do |t|
      t.integer :author_id
      t.integer :chain_id
      t.datetime :date
      t.text :link_text
      t.string :title
      t.timestamps
    end
  end
  def down
    drop_table :links
  end
end
