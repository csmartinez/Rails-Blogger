class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :comment, :string
      t.column :author, :string
      t.column :post_id, :integer

      t.timestamps
    end
  end
end
