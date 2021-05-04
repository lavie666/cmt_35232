class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string     :name,           null: false
      t.string     :name_hiragana,  null: false
      t.date       :birthday
      t.integer    :prefecture_id
      t.integer    :from_id
      t.string     :corporation
      t.string     :drink
      t.string     :food
      t.string     :cigarettes
      t.text       :text
      # t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
