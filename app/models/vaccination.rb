# == Schema Information
#
# Table name: vaccinations
#
#  id         :integer          not null, primary key
#  child_id   :integer
#  vaccine_id :integer
#  status     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vaccination < ActiveRecord::Base
  # a vaccination belongs to a child
  belongs_to :child
  # and also belongs to a vaccine
  belongs_to :vaccine
  
  attr_accessible :child_id, :status, :vaccine_id

  validates :status, presence: true, inclusion: { in: %w(scheduled given duenow notgiven) }
end
