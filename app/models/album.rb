class Album
  include Mongoid::Document
  field :name, type: String
  field :desc, type: String
  field :date, type: Date

  embeds_many :photos
  belongs_to :user
end
