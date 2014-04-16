class Photo < ActiveRecord::Base

  attr_accessible :photo, :post_id

  belongs_to :post

  has_attached_file :photo, 
    :styles => { large: '1000x648>', display: '500x324', :icon => "100x100"},
    :default_style => :display,
    :storage => :s3,
    :s3_credentials => {
      :access_key_id     => ENV["S3_ACCESS_KEY_ID"],
      :secret_access_key => ENV["S3_SECRET_ACCESS_KEY"]
    },
    :bucket => ENV["S3_BUCKET"]

  def as_json(options={})
    super(options).merge({
      :photo_large_url => self.photo(:large),
      :photo_display_url => self.photo(:display),
      :thumbnail_url => self.photo(:icon),
    })
  end

  validates_attachment_content_type :photo, :content_type => [/\Aimage\/.*\Z/]

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "photo_large_url" => self.photo(:large),
      "photo_display_url" => self.photo(:display),
      "thumbnail_url" => self.photo(:icon),
      "name" => read_attribute(:photo_file_name),
      "size" => read_attribute(:photo_file_size),
      "url" => self.photo(:display),
      "delete_url" => admins_post_photo_url(:post_id => self.post_id, :id => self.id, :only_path => true),
      "delete_type" => "DELETE" 
    }
  end 

end