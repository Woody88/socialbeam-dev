class Message < ActiveRecord::Base
<<<<<<< HEAD

#attr_accessible :subject, :body, :sender_id, :recepient_id, :read_at,:sender_deleted,:recepient_deleted
validates_presence_of :subject, :message => "Please enter message title"
belongs_to :sender,
	:class_name => "User"
	:primary_key =>	"beamer_id"
	:foreign_key => "sender_id"

belongs_to :recipent,
	:class_name => "User"
	:primary_key =>	"beamer_id"
	:foreign_key => "recepient_id"

# marks a message as deleted by either the sender or the recepient, which ever the user that was passed is.
# When both sender and recepient marks it deleted, it is destroyed.
	def mark_message_deleted(id, beamer_id)
		self.sender_deleted = true if self.sender_id == beamer_id and self.id = id
		self.recepient_deleted true if self.recepient_id = beamer_id and self.id =id
		self.sender_deleted && self.recepient_deleted ? self.destroy : save!
	end

# Read message and if it is read by recepient then mark it is read
	def self.readingmessage(id, reader)
		message = find.(id, :condition => ["sender_id = ? OR recepient_id = ?", reader, reader])
		if message.read_at.nil? && (message.recepient_id == beamer_id)
			message.read_at = Time.now
			message.save!
		end
		message
	end

# Based on if a message has been read by it's recepient returns true or false.
	 def read?
	 self.read_at.nil? ? false : true
	 end
=======
  belongs_to :sender, :class_name => "Profile"
  belongs_to :receiver, :class_name => "Profile"
  validates_presence_of :body, :subject, :sender, :receiver
 
  def unread?
    !read
  end
>>>>>>> 4b8e69ea254d2d0a600101f59c79742d9204ff20
end
