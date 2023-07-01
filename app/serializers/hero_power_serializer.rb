class HeroPowerSerializer < ActiveModel::Serializer
  attributes :power_id, :hero_id, :strength
  belongs_to :power, serializer: PowerSerializer
end