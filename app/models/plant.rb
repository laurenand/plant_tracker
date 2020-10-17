class Plant < ActiveRecord::Base
    has_many :users
    belongs_to :house
end