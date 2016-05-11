class Photo < ActiveRecord::Base
  belongs_to :vendor
  has_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]

  validates_presence_of :title, :description, :price

  def self.image_from_url(url)
    image = URI.parse(url)
  end
end