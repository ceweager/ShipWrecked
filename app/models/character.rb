class Character < ApplicationRecord
  belongs_to :user
  has_many :goals, dependent: :destroy
  has_many :milestones, through: :goals, dependent: :destroy
  has_many :postthreads, through: :milestones, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_one_attached :photo
  validates :name, :age, :gender, :birthday, :sexuality, :positive, :negative, :personality, :history, :other,
            :overview, presence: true
  validates :overview, length: { maximum: 2000,
                                 too_long: '%{count} characters is the maximum allowed' }
  validates :positive, :negative, length: { maximum: 100,
                                            too_long: '%{count} characters is the maximum allowed' }
  validates :personality, :history, :other, length: { maximum: 30_000,
                                                      too_long: '%{count} characters is the maximum allowed' }
  after_create :add_default_avatar

  def add_default_avatar
    unless photo.attached?
      photo.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_pic.jpg'
          )
        ), filename: 'default_pic.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end
