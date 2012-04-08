class Pomodoras < ActiveRecord::Base
  belongs_to :user


  after_find :clarify_status

  def left
    30.minutes - (Time.now - self.created_at)
  end

  private
  def clarify_status
    self.status = "rest" if self.left < 5.minutes
    self.status = "free" if self.left < 0
    self.status = "busy" if self.left > 5.minutes
  end

end
