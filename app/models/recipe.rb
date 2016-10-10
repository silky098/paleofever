# == Schema Information
#
# Table name: recipes
#
#  id               :integer          not null, primary key
#  name             :text
#  image            :text
#  video            :text
#  servings         :integer
#  preparation_time :integer
#  ingredients      :text
#  method           :text
#  tips             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  category_id      :integer
#  user_id          :integer
#

class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
end
