class Tenant < ApplicationRecord
    has_many :apartments
    has_many :leases

    validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
    validates :name, presence: true
end
