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
  belongs_to :city
  belongs_to :neighborhood
  # has_many :neighborhoods
  validates :description, :presence => true
  validates :neighborhood_id_1, :presence => true
  validates :neighborhood_id_2, :presence => true
  validates :user_id, :presence => true

  # This is what worked when I had it inline in the HTML page
  # <%= City.where(:id=>Neighborhood.where(:id=>a_reason.neighborhood_id_2).at(0).city_id).at(0).name %>
  attr_accessor(:city)

  def city
    city = City.where(:id => Neighborhood.where(:id => self.neighborhood_id_2).at(0).city_id).at(0)
    return city
  end
end
