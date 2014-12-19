<<<<<<< HEAD
class User < ActiveRecord::Base
	include BCrypt
	attr_accessor :password
	before_save :encrypt_password
	before_save :create_unique_profile_id

	validates_confirmation_of :password, :message => "Password do not match."
	validates_presence_of :password, :message => "Please Enter a password."
	validates_presence_of :email, :message => "Email ID field cannot be blank."
	validates_uniqueness_of :email, :message => "Sorry this Email ID is already registered."
	validates_presence_of :first_name, :message => "First name field connot be blank."
	validates_presence_of :last_name, :last_name => "Last name field cannot be blank.c"

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	def create_unique_profile_id
		begin
			self.profile_id = SecureRandom.hex(8)
		end while self.class.exists?(:profile_id => profile_id)
	end

end
=======
require 'digest/sha1' 
require 'mime/types'
class User < ActiveRecord::Base
  acts_as_authentic do|conf|
    conf.login_field = :email
  end
  attr_accessible :email, :password, :password_confirmation, :login
  attr_protected :is_admin, :can_send_messages
  validates_presence_of :login
  validates_length_of :login, :within => 3..40
  validates_uniqueness_of :login, :case_sensitive => false

  has_one :profile, :dependent => :nullify
  after_create :set_profile
  after_destroy :update_profile

  delegate :full_name, :to=>:profile

  #Authentications
  validate do |user|
    if user.new_record? #adds validation if it is a new record
      user.errors.add(:password, "is required") if user.password.blank?
      user.errors.add(:password_confirmation, "is required") if user.password_confirmation.blank?
      user.errors.add(:password, "Password and confirmation must match") if user.password != user.password_confirmation
    elsif !(!user.new_record? && user.password.blank? && user.password_confirmation.blank?) #adds validation only if password or password_confirmation are modified
      user.errors.add(:password, "is required") if user.password.blank?
      user.errors.add(:password_confirmation, "is required") if user.password_confirmation.blank?
      user.errors.add(:password, " and confirmation must match.") if user.password != user.password_confirmation
      user.errors.add(:password, " and confirmation should be atleast 4 characters long.") if user.password.length < 4 || user.password_confirmation.length < 4
    end
  end

  def set_profile
    p = Profile.find_or_create_by_email self.email
    raise 'User found when should be nil' unless p.user.blank?
    p.is_active=true
    p.user_id = id
    p.save
  end
  
  def update_profile
    profile.update_attributes :is_active=>false
  end

  def f
    profile.f
  end

  def can_mail? user
    can_send_messages? && profile.is_active?
  end
end
>>>>>>> 4b8e69ea254d2d0a600101f59c79742d9204ff20
