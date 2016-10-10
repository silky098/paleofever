# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  recipe_type :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :recipes
end
