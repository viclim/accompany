class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  belongs_to :department

  def role?(role_name)
    role.downcase == role_name.to_s.downcase
  end

  def hr?
    department.try(:name).try(:downcase) == 'hr'
  end
end
