class ChangeDateOfBirthToBeDateInResumes < ActiveRecord::Migration[6.0]
  def change
    change_column :resumes, :date_of_birth, :date, using: 'date_of_birth::date'
  end
end
