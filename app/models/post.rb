class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :child_name, presence: true
  validates :thread_color, presence: true, length: { maximum: 4 }
  validates :font_name, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader

  def delete_with_image
    self.destroy
    Dir.rmdir("#{Rails.root.to_s}/public/uploads/post/image/#{self.id}")
  end

end
