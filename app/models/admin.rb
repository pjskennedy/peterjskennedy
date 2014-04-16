class Admin < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

      # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :is_admin
  attr_accessible :provider, :uid, :approved

  scope :approved, -> { where(approved: true) }
  scope :denied, -> { where(approved: false) }
       
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    admin = Admin.find_or_create_by_email(data["email"])

    admin.update_attributes(
      email: data["email"],
      password: Devise.friendly_token[0,256],
      uid: data["id"]
    )
    admin
  end

end
