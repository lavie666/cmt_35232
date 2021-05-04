class Client < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :from

  has_one_attached :image

  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :name_hiragana, format: { with: /\A[ぁ-んー－]+\z/ }
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :from_id
  end 
end
