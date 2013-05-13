class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.integer :company_id
      t.integer :status, :default => 0 
      t.string :company_name
      t.string :company_url
      t.string :angellist_profile

      t.timestamps
    end
    add_index :startups, :company_id, :unique => true
  end
end
