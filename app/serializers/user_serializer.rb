class UserSerializer < ActiveModel::Serializer
  attributes :id, 
  :name, 
  :email_address, 
  :password_digest,
  :organizations,
  :shifts
  
  has_many :organizations
  has_many :shifts
end
