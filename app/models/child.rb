# == Schema Information
#
# Table name: children
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  date_of_birth :date
#  gender        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#

class Child < ActiveRecord::Base
  # a child belongs to an user
  belongs_to :user
  # a child has many vaccinations scheduled
  has_many :vaccinations,  dependent: :destroy
  # thereby many vaccines through each of the vaccinations
  has_many :vaccines, through: :vaccinations

  attr_accessible :user_id, :date_of_birth, :gender, :name

  validates :name, presence: true, length: { maximum: 50 }
  validates :gender, presence: true
  validate :birth_date_not_in_future

  after_create :create_vaccinations

  def birth_date_not_in_future
    # date of birth can't be a date in future
    if date_of_birth > Date.today
      errors.add(:date_of_birth, "Birth date cannot be in future")
    end
  end

  private
  def create_vaccinations
    # should be executed after a child is created
    # for each vaccine, create an vaccination entry for the child
    Vaccine.all.each do |vaccine|
      self.vaccinations.create(vaccine_id: vaccine.id, status: 'notgiven')
    end
  end

end
