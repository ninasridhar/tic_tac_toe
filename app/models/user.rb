class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :photo, :username, :games
  has_secure_password

  mount_uploader :photo, PhotoUploader

  validates :password, presence: true, on: :create
  validates :email, presence: :true, uniqueness: {case_sensitive: false}

  has_many :games
  has_many :moves

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end
  
end
