# == Schema Information
#
# Table name: vaccines
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  disease        :string(255)
#  recommended_by :string(255)
#  age_start      :integer
#  age_end        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  dosage         :string(255)
#  route          :string(255)
#

class Vaccine < ActiveRecord::Base
  # a vaccine is associated to many vaccinations scheduled
  has_many :vaccinations
  # and thereby to many children through each vaccination
  has_many :children, through: :vaccinations
  
  attr_accessible :age_end, :age_start, :disease, :name, :recommended_by, :dosage, :route

  validates :name, presence: true, length: { maximum: 50 }
  validates :disease, presence: true, length: { maximum: 50 }
  validates :age_start, presence: true, numericality: { only_integer: true }
  validates :age_end, presence: true, numericality: { only_integer: true }
  validates :dosage, presence: true, inclusion: { in: %w(single multiple) }
  validates :route, presence: true, inclusion: { in: %w(Oral ID SC IM) }
end
