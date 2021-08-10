class User < ApplicationRecord
    
    has_secure_password
    has_many :organization_users
    has_many :organizations, through: :organization_users
    has_many :shifts

end
