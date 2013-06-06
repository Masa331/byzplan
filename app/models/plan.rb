# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  plan_id    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string(255)
#

class Plan < ActiveRecord::Base

#  require 'securerandom'

  attr_accessible :name, :category

 # before_save :generate_plan_id

  validates :name, presence: true, length:{maximum:50}
  validates :category, length:{maximum:50}
  validates :plan_id, presence: true, uniqueness: true

#  def generate_plan_id
#  	self.plan_id = SecureRandom.urlsafe_base64(20)
#  end
end
