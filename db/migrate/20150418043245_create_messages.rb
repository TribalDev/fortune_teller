class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :advice
      t.string :author

      t.timestamps
    end
  end
end
