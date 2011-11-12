class Member < ActiveRecord::Base
	attr_accessible :FirstName, :LastName, :Email, :Password
	
	validates :FirstName, :presence=>true
	validates :LastName, :presence=>true
	validates :Email, :presence=>true
	validates :Password, :presence=>true
	has_many :items, :foreign_key => 'SellerID', :dependent => :destroy
	has_many :items, :foreign_key => 'BuyerID', :dependent => :destroy
	has_one :bank_acct, :dependent => :destroy
	has_many :bidder_period_items, :dependent => :destroy
	
	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil  if user.nil?
		return user if user.has_password?(submitted_password)
	end

	def self.authenticate_with_salt(id, cookie_salt)
		user = find_by_id(id)
		(user && user.salt == cookie_salt) ? user : nil
	end
end
