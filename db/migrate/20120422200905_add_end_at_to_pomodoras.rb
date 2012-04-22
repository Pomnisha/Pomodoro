class AddEndAtToPomodoras < ActiveRecord::Migration
  def change
    add_column :pomodoras, :end_at, :datetime, :default => "2012-01-01 00:00:01"
  end
end
