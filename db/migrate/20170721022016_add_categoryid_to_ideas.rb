class AddCategoryidToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_reference :ideas, :category, foreign_key: true
  end
end
