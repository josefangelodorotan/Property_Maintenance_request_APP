class AddScheduleDateToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :schedule_date, :date
  end
end
