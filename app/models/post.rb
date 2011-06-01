class Post < ActiveRecord::Base
	acts_as_mappable :default_units => :kms, 
										:default_formula => :sphere, 
										:distance_field_name => :distance,
										:lat_column_name => :lat,
										:lng_column_name => :lng


	# validates_presence_of :zip_code
	# validates_presence_of :email, :message => "required to post"	
	# validates_uniqueness_of :email, :scope => :buying_or_selling
	# validates_uniqueness_of :email,:email_format => true
	
	validates :email, {:presence => { :message => "^Here ya go! If you want to post your email... provide an email" }, :uniqueness => true}
	validates :zip_code, :presence => true
	
	scope :buying, where({buying_or_selling: "buy"})
	scope :selling, where({buying_or_selling: "sell"})
	scope :old, where("created_at < ?", (Time.now-7.days))

end
