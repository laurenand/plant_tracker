class User < ActiveRecord::Base
    validates :username, presence: true
    validates :username, uniqueness: true
    has_secure_password
    has_many :plants
end