class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :response
      t.references :user, foreign_key: true, index: true
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps
    end
    add_index :comments, [:commentable_type, :commentable_id]
  end
end
