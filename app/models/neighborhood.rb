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
end
