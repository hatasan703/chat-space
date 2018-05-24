class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :body, default: ''
      t.string :image, default: ''
      t.references :group, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.timestamps null: false
    end
  end
end
