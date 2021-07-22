class Signup < ApplicationRecord
    validates :time, length: {in: 0..23}

    belongs_to :activity
    belongs_to :camper
end
