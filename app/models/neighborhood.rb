# == Schema Information
#
# Table name: neighborhoods
#
#  id          :integer          not null, primary key
#  description :text
#  lat         :decimal(, )
#  lng         :decimal(, )
#  name        :string
#  wiki_link   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  city_id     :integer
#
class Neighborhood < ApplicationRecord
  belongs_to :city

  validates :name, :presence => true
  # validates :name, :uniqueness => true
  validates(:name, { :uniqueness => { :scope => [:city_id] } })

  has_many :reasons_as_1, class_name: "Reason", foreign_key: :neighborhood_id_1
  has_many :reasons_as_2, class_name: "Reason", foreign_key: :neighborhood_id_2

  has_many :other_neighborhoods_1, through: :reasons_as_1, source: :neighborhood_2
  has_many :other_neighborhoods_2, through: :reasons_as_2, source: :neighborhood_1

  def all_reasons
    reason_ids = self.reasons_as_1.pluck(:id) + self.reasons_as_2.pluck(:id)

    return Reason.where(id: reason_ids)
  end

  def other_neighborhoods
    other_neighborhood_ids = self.other_neighborhoods_1.pluck(:id) + self.other_neighborhoods_2.pluck(:id)

    return Neighborhood.where(id: other_neighborhood_ids)
  end
end
