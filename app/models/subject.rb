class Subject < ApplicationRecord

  has_many :faculties, through: :faculty_subjects
  has_many :faculty_subjects

  has_many :users, through: :student_subjects
  has_many :student_subjects

  has_many :feedbacks

  def self.import(file)
    spreadsheet = open_spreadsheet(file)   # => defined in ApplicationRecord.rb file
    header = spreadsheet.row 1
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # if row["code"].empty? == false
        # subject = find_by_code(row["code"])
      # else
        subject = find_by_code(row["code"]) || Subject.new
      # end
        subject.code = row["code"]
        subject.name = row["name"]
        subject.save!
    end
  end


end
