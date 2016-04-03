class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :encryptable, :authentication_keys => [:login]

  after_initialize :create_login, :if => :new_record?

  def create_login
    if self.username.blank?
      email = self.email.split(/@/)
      login_taken = User.where(:username => email[0]).first
      unless login_taken
        self.username = email[0]
      else
        self.username = self.email
      end
    end
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  private

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", {:value => login.downcase}]).first
    else
      where(conditions.to_h).first
    end
  end


end
