class Recipe < ApplicationRecord
    validates :title, presence: true, length: {maximum: 25}
    validates :ingredient, presence: true, length: {maximum: 150}
    validates :how_to, presence: true, length: {maximum: 300}
    validates :r_image, presence: true
    validates :kind, presence: true
    validates :user_id, presence: true
    belongs_to :user
    has_many :likes, dependent: :destroy
    mount_uploader :r_image, ImagesUploader
end
