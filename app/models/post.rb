class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  before_save :create_universal_picture_link
  private

  def create_universal_picture_link
  	begin
  		self.universal_picture_link = LinkThumbnailer.generate(universal_link).images.first.src.to_s
  	rescue
  		self.universal_picture_link ||= "mandelbrot.png"
  	end
  end
  

end


