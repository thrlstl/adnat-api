class Organization < ApplicationRecord

    has_many :organization_users
    has_many :users, through: :organization_users
    has_many :shifts

end
