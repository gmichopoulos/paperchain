class CreateInvitations < ActiveRecord::Migration
  def up
    create_table :invitations do |t|
      t.integer :author_id
      t.integer :chain
      t.integer :invitor
      t.timestamps
    end
  end

  def down
    drop_table :invitations
  end
end
