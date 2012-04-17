class Pomodoras < ActiveRecord::Base
  belongs_to :user


  after_find :clarify_status

  def left
    (self.user.pomodoro_length + self.user.rest_length).minutes - (Time.now - self.created_at)
  end

  private
  def clarify_status
    self.status = "rest" if self.left < self.user.rest_length.minutes
    self.status = "free" if self.left < 0
    self.status = "busy" if self.left > self.user.rest_length.minutes
  end

end
