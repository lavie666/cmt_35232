class Client < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :from

  has_one_attached :image

  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :name_hiragana, format: { with: /\A[ぁ-んー－]+\z/ }
  end

  belongs_to :user
  has_many :calendars, dependent: :destroy

  def self.search(search)
    if search != ""
      Client.where('name LIKE(?)', "%#{search}%")
    else
      Client.all
    end
  end

end
