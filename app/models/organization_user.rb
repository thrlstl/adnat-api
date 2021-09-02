class OrganizationUser < ApplicationRecord
  
  belongs_to :user, touch: true
  belongs_to :organization, touch: true

end
