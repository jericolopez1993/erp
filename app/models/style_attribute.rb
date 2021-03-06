# == Schema Information
#
# Table name: style_attributes
#
#  id         :bigint(8)        not null, primary key
#  product_id :integer
#  name       :string
#  value      :string
#  default    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  height     :decimal(, )
#  width      :decimal(, )
#  finish     :string
#

class StyleAttribute < ApplicationRecord
	belongs_to :product

	validates :product_id, presence: true

	FIELD_NAMES = ['value', 'default', 'height', 'width', 'finish']
end
