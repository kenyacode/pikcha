class User
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  attr_reader :password
  field :password_digest, type: String

	mount_uploader :image, AvatarUploader

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true, confirmation: true, length: { in: 6..20 }
  validates :password, confirmation: true, length:{in:6..20}, on: :update, allow_blank: true

   def password=(unencrypted_password)
    unless unencrypted_password.empty?
      # keep the unencrypted password in memory for a second
      @password = unencrypted_password
      # use BCrypt to encrypt our plain password into a digest
      # and store it in our database
     	self.password_digest = BCrypt::Password.create(unencrypted_password)
      end
    end

   def authenticate(unencrypted_password)
   	if BCrypt::Password.new(self.password_digest) == unencrypted_password
   		return self
   	else
   		return false
   	end
   end
end
