class ChangeAgent < ActiveRecord::Base
  validates_length_of :quote, :maximum => 255
  validates_presence_of :first_name, :last_name, :location, :quote

  default_scope { order(last_name: :asc) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
