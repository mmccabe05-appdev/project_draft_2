# == Schema Information
#
# Table name: cities
#
#  id          :integer          not null, primary key
#  description :string
#  lat         :decimal(, )
#  lng         :decimal(, )
#  name        :string
#  state       :string
#  wiki_link   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class City < ApplicationRecord
end
