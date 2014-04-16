class Post < ActiveRecord::Base

  attr_accessible :title, :longitude, :latitude, :markdown, :is_public, :time_posted

  validates :title, uniqueness: true
  validates :title, presence: true, allow_blank: false
  validates :longitude, :presence => true, allow_blank: false
  validates :latitude, :presence => true, allow_blank: false
  validates :markdown, :presence => true, allow_blank: false

  scope :published, -> { where(is_public: true).sort_by(&:time_posted).reverse }

  has_many :photos

  COORDINATE_PRECISION = 5

  before_save :update_posted_time

  def self.published_post(id)
    where(:is_public => true).find(id)
  end

  def update_posted_time
    self.time_posted = DateTime.now if is_public and time_posted.nil?
  end

  def compile
    unless markdown.nil?
      HTMLWithRouge.render(markdown).html_safe
    else
      "<i>No Content</i>".html_safe
    end
  end

  def coordinates
    if latitude.nil? or longitude.nil?
      "0 °N, 0 °W"
    else
      lat_dir = latitude >= 0 ? "N" : "S"
      long_dir = longitude >= 0 ? "E" : "W"
      lat_amp = latitude.abs.round(COORDINATE_PRECISION)
      long_amp = longitude.abs.round(COORDINATE_PRECISION)
      "#{lat_amp} °#{lat_dir}, #{long_amp} °#{long_dir}"
    end
  end

  def posted_at
    time_posted || DateTime.now
  end

  def public?
    is_public
  end

  def self.most_recent
    published.first
  end

end
