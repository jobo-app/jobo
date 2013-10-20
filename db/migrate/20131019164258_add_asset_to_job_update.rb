class AddAssetToJobUpdate < ActiveRecord::Migration
  def change
    add_column :job_updates, :asset, :string
  end
end
