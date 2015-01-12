class User
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String

	mount_uploader :image, AvatarUploader

  # def password=(unencrypted_password)
  # 	self.password_digest = BCrypt::Password.create(unencrypted_password)
  # end

  # def authenticate(unencrypted_password)
  # 	if BCrypt::Password.new(self.password_digest) == unencrypted_password
  # 		return self
  # 	else
  # 		return false
  # 	end
  # end

end
