class AddScheduledDateToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :scheduled_date, :date
  end
end
