class CreateWeightedWord < ActiveRecord::Migration
  def change
    create_table :weighted_words do |t|
      t.references :word_search, null: false, index: true
      t.string :word, null: false
      t.integer :frequency, null: false
      t.timestamps
    end
  end
end
