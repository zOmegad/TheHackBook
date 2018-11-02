class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :anonymous_commentor
      t.text :content
      t.references :user, foreign_key: true
      t.references :gossip, foreign_key: true

      t.timestamps
    end
  end
end
