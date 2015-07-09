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
#  due_start  :date
#  due_end    :date
#

class Vaccination < ActiveRecord::Base
  # a vaccination belongs to a child
  belongs_to :child
  # and also belongs to a vaccine
  belongs_to :vaccine
  
  attr_accessible :child_id, :status, :vaccine_id

  before_save :create_vaccination_due_dates

  validates :status, presence: true, inclusion: { in: %w(given duenow skipped notgiven) }

  private
  def create_vaccination_due_dates
    # get child dob
    dob = self.child.date_of_birth
    # find due start period in days
    start_days = self.vaccine.age_start * 7
    # add due start period to dob to set due start date
    self.due_start = dob + start_days
    # find due end period in days
    end_days = self.vaccine.age_end * 7
    # add due end period to dob to set due end date
    self.due_end = dob + end_days
  end
end
