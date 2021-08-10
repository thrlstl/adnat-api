class ShiftSerializer < ActiveModel::Serializer
  attributes :id, 
  :shift_date, 
  :shift_start, 
  :shift_finish, 
  :break_length, 
  :hours_worked,
  :shift_length, 
  :shift_cost, 
  :user, 
  :organization
end
