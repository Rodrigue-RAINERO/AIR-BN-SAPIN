class RenameTitreToTitleInTrees < ActiveRecord::Migration[7.1]
  def change
    rename_column :trees, :titre, :title
  end
end
