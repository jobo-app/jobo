class RemoveCommunicationsFromJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :communications
  end

  def down
    add_column :jobs, :communications, :text
  end
end
