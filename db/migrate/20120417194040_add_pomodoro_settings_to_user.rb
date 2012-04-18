class AddPomodoroSettingsToUser < ActiveRecord::Migration
  def change
    add_column :users, :pomodoro_length, :integer, :default => 25
    add_column :users, :rest_length, :integer, :default => 5
  end
end
