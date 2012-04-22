class Pomodoras < ActiveRecord::Base
  belongs_to :user
  after_find :clarify_status

  def left
    self.end_at - Time.now
  end

  def left_to_time
    if self.left >= 0
      @hours = (self.left / 3600).truncate
      @minutes = ((self.left % 3600) /60).truncate
      @seconds = (self.left % 60).truncate
      s = ""
      [@hours, @minutes, @seconds].each do |arg|
        if arg > 0
          if arg < 10
            s += "0#{arg}"
          else
            s += "#{arg}"
          end
        else
          s += "00"
        end
        s += ":"
      end
      s[0..-2]
    else
      "00:00:00"
    end
   end

  private
  def clarify_status
    self.status = "green" if self.left < 0
  end

end
