class Gif < ApplicationRecord
  has_one_attached :image

  validate :image_size, on: :create

  def image_size
    if image.attached?
      if image.blob.byte_size > 1_000_000
        errors[:image] << 'too big'
      elsif !image.blob.content_type.starts_with?('image/gif')
        image.purge
        errors[:image] << 'wrong format'
      end
    end
  end
end
