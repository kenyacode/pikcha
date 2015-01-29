class Album
  include Mongoid::Document
  field :name, type: String
  field :desc, type: String
  field :created, type: Date
  field :updated, type: Date

  embeds_many :photos, cascade_callbacks: true
  belongs_to :user

  mount_uploader :photo, PhotoUploader
  accepts_nested_attributes_for :photos
end
