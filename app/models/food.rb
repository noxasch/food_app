# == Schema Information
#
# Table name: foods
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  price      :decimal(, )      default(0.0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Food < ApplicationRecord
  validates :name, presence: true, allow_blank: false
end
