class CreateOpportunities < ActiveRecord::Migration
  def self.up
    create_table :opportunities do |t|
      t.string :name
      t.text :description
      t.string :date
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :opportunities
  end
end
