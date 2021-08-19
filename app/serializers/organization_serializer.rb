class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :hourly_rate, :users, :shifts 
  
  has_many :users
  has_many :shifts
end
