class AddIfSoldToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :if_completed, :boolean
  end
end
