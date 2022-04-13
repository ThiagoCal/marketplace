class RenameSalesToBuys < ActiveRecord::Migration[6.1]
  def self.up
    rename_table :sales, :buys
  end

  def self.down
    rename_table :buys, :sales
  end
end
