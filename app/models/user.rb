class User < ApplicationRecord
    
    has_secure_password
    has_many :organization_users
    has_many :organizations, through: :organization_users, dependent: :destroy
    has_many :shifts

    def other_organizations
        joined_organizations = self.organizations
        all_organizations = Organization.all
        (joined_organizations + all_organizations) - (joined_organizations & all_organizations)
    end
    
end
