class ChangePhoneticNameToNickname < ActiveRecord::Migration
  def change
    rename_column :students, :phonetic_name, :nickname
  end
end
