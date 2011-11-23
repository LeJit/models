require 'digest'
class Member < ActiveRecord::Base
	attr_accessor :password
	attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
	
	validates :first_name, :presence=>true,
						   :length   => { :maximum => 50 }
	
	validates :last_name, :presence=>true,
						  :length   => { :maximum => 50 }
						  
	validates :email,     :presence=>true
	
	validates :password, :presence     => true,
						 :confirmation => true,
                         :length       => { :within => 6..40 }
	
	has_many :items, :foreign_key => 'seller_id', :dependent => :destroy
	
	has_many :items, :foreign_key => 'buyer_id', :dependent => :destroy
	
	has_one :bank_acct, :dependent => :destroy
	
	has_many :bidder_period_items, :dependent => :destroy
	
	before_save :encrypt_password
	
	
	def has_password?(submitted_password)
		self.encrypted_password == encrypt(submitted_password)
    end
	
	def self.authenticate(email, submitted_password)
		member = find_by_email(email)
		return nil  if member.nil?
		return member if member.has_password?(submitted_password)
	end

	def self.authenticate_with_salt(id, cookie_salt)
		member = find_by_id(id)
		(member && member.salt == cookie_salt) ? member : nil
	end
	
	
	
	private

    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end	
	
	def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
	
	def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
	
end
