class CreateBooks < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string  :name
      t.text    :description

      t.timestamps
    end

    create_table :books do |t|
      t.string            :name
      t.text              :description
      t.belongs_to        :user
      t.boolean           :draft
      t.has_attached_file :cover

      t.timestamps
    end

    create_table :authors_books, id: false do |t|
      t.belongs_to :book,   index: true
      t.belongs_to :author, index: true
    end

    create_table :books_groups, id: false do |t|
      t.belongs_to :book,   index: true
      t.belongs_to :group,  index: true
    end
  end
end
