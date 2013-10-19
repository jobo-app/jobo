class AddTypeToJobUpdate < ActiveRecord::Migration
  def change
    add_column :job_updates, :type, :string
  end
end
