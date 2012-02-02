class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text
      t.integer :id, :null => false

      t.timestamps
    end
  end
end
