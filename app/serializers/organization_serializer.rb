class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :updated_at, :name, :hourly_rate, :users, :shifts
  
  has_many :users
  has_many :shifts
end
