class CreateAuthorsChains < ActiveRecord::Migration
  def up
    create_table :authors_chains, :id => false do |t|
      t.references :author
      t.references :chain
    end
  end

  def down
    drop_table :authors_chains
  end
end
