class ChangesTypeInResourceToTypeOf < ActiveRecord::Migration
  def change
    rename_column :resources, :type, :type_of
  end
end
