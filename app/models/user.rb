class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %w[student teacher]

  validates :teacher_code, presence: true, if: -> { role == 'teacher' }
  validate :valid_teacher_code, if: -> { role == 'teacher' }

  def valid_teacher_code
    unless teacher_code == 'HOSEA66'
      errors.add(:teacher_code, "is invalid")
    end
  end
end
