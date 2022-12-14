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
  
  belongs_to :neighborhood_1, class_name: "Neighborhood", foreign_key: :neighborhood_id_1
  belongs_to :neighborhood_2, class_name: "Neighborhood", foreign_key: :neighborhood_id_2

  has_one :city_1, through: :neighborhood_1, source: :city
  has_one :city_2, through: :neighborhood_2, source: :city

  # has_many :neighborhoods
  validates :description, :presence => true
  validates :neighborhood_id_1, :presence => true
  validates :neighborhood_id_2, :presence => true
  validates :user_id, :presence => true

  # This is what worked when I had it inline in the HTML page
  # <%= City.where(:id=>Neighborhood.where(:id=>a_reason.neighborhood_id_2).at(0).city_id).at(0).name %>
  # attr_accessor(:city)

  def city
    city = City.where(:id => Neighborhood.where(:id => self.neighborhood_id_2).at(0).city_id).at(0)
    return city
  end

  def net_votes
    net_votes = self.upvotes - self.downvotes
    return net_votes
  end

end
