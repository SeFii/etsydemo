class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "300x>", :thumb => "100x100>" }, :default_url => "default.png"
		validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	else
	  has_attached_file :image, :styles => { :medium => "300x>", :thumb => "100x100>" }, :default_url => "default.png", 
	  :storage => :dropbox, 
	  :dropbox_credentials => Rails.root.join("config/dropbox.yml"), 
	  :path => ":style/:id_:filename"
	  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	end  
end
