class Shift < ApplicationRecord
  validates :start, :finish, :organization, :user, :break_length, presence: true
  validates :break_length, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 60 }, allow_blank: true
  validate :shift_scheduling, if: :dates_and_break_present?
  belongs_to :organization, touch: true
  belongs_to :user
  
  def dates_and_break_present?
    start.presence && finish.presence && break_length.presence
  end

  def shift_scheduling
    if finish < start || start == finish
      errors.add(:finish, "Sorry, shift must finish later than start day/time.")
    elsif hours_worked < 1
      errors.add(:finish, "Sorry, shifts must be 1+ hours excluding break.")
    end
  end

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
