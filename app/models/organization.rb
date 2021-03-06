class Organization < ApplicationRecord
    validates :name, :hourly_rate, presence: true
    validates :hourly_rate, numericality: { greater_than_or_equal_to: 11 }, allow_blank: true
    has_many :organization_users
    has_many :users, through: :organization_users, dependent: :destroy
    has_many :shifts

end
