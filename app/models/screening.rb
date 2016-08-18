class Screening < ActiveRecord::Base
  validates :screening_time, :uniqueness => true
end
