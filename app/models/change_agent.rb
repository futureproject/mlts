class ChangeAgent < ActiveRecord::Base
  validates_length_of :quote, :maximum => 255
end
