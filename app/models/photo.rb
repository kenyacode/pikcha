class Photo
  include Mongoid::Document
  field :caption, type: String

  embedded_in :album

  mount_uploader :image, PhotoUploader
end
