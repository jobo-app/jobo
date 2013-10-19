class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company_name
      t.string :position_title
      t.text :communications

      t.timestamps
    end
  end
end
