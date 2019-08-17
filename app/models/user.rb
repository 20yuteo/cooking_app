class User < ApplicationRecord
    validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
    validates :email, presence: true, uniqueness: true, length: { maximum: 255}
    validates :password, presence: true, length: { maximum: 6}, allow_nil: true, uniqueness: true
    has_many :recipes, dependent: :destroy
    has_many :likes, dependent: :destroy
    mount_uploader :u_image, ImagesUploader
end
