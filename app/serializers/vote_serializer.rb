class VoteSerializer < ActiveModel::Serializer
  attributes :id, :author, :born_died, :title, :date, :technique, :location, :url, :form, :style, :school, :timeframe
end
