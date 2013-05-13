class AddEmailToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :emails, :string
  end
end
