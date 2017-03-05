class AddTimestamp < ActiveRecord::Migration
  def change
    add_column :suggestions, :created_at, :timestamp
    add_column :suggestions, :updated_at, :timestamp
  end
end
