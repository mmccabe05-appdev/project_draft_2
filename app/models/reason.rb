# == Schema Information
#
# Table name: reasons
#
#  id                :integer          not null, primary key
#  description       :string
#  downvotes         :integer
#  link              :string
#  neighborhood_id_1 :integer
#  neighborhood_id_2 :integer
#  upvotes           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#
class Reason < ApplicationRecord
  belongs_to :user
  has_many :neighborhoods
  validates :description, :presence => true
  validates :neighborhood_id_1, :presence => true
  validates :neighborhood_id_2, :presence => true
  validates :user_id, :presence => true
end
