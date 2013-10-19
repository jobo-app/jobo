class CreateJobUpdates < ActiveRecord::Migration
  def change
    create_table :job_updates do |t|
      t.text :description
      t.references :job, index: true

      t.timestamps
    end
  end
end
