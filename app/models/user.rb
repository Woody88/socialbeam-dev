class User < ActiveRecord::Base
	include BCrypt
	attr_accessor :password
	before_save :encrypt_password

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


end
