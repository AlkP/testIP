class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string  :name
      t.string  :ip,        null: false,  unique: true
      t.boolean :switched,  null: false,  default: true
      t.boolean :deleted,   null: false,  default: false

      t.timestamps null: false
    end
  end
end
