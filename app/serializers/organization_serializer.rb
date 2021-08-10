class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :hourly_rate, :users

  has_many :shifts
end
