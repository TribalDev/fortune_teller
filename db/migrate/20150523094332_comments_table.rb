class CommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text    :body
      t.integer :user_id
      t.integer :message_id

      t.timestamps
    end
  end
end
