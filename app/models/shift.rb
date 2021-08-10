class Shift < ApplicationRecord
  
  belongs_to :organization
  belongs_to :user

  def shift_date 
    self.start.strftime('%m/%d/%Y')
  end

  def shift_start
    self.start.strftime('%I:%M%p')
  end

  def shift_finish
    self.finish.strftime('%I:%M%p')
  end

  def shift_length
    shift_length = self.finish - self.start
    (shift_length / 3600).round(2)
  end

  def hours_worked
    (shift_length - (self.break_length / 60.00)).round(2)
  end

  def shift_cost
    (self.hours_worked * self.organization.hourly_rate).round(2)
  end

end
