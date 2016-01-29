class CreateWordSearch < ActiveRecord::Migration
  def change
    create_table :word_searches do |t|
      t.string :url, null: false
      t.timestamps
    end

    add_index :word_searches, :url, unique: true
  end
end
