class UserSerializer < ActiveModel::Serializer
  attributes :id, 
  :name, 
  :email_address, 
  :organizations,
  :shifts
  
  has_many :organizations
  has_many :shifts
end
