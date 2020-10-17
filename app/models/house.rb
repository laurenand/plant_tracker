class House < ActiveRecord::Base
    has_many :plants
    belongs_to :user
end