class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.datetime :published
      t.text :content
      t.string :url
      t.boolean :like , :default => false
      t.string :g_id
      t.integer :feed_id

      t.timestamps null: false
    end
  end
end
