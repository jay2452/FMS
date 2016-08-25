class FacultySubject < ApplicationRecord
  belongs_to :subject
  belongs_to :faculty

  def self.import(file)
    spreadsheet = open_spreadsheet(file)   # => defined in ApplicationRecord.rb file
    header = spreadsheet.row 1
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # if row["code"].empty? == false
        # subject = find_by_code(row["code"])
      # else
      fac_id = Faculty.where("emp_id = ? AND name = ?", row["emp_id"], row["name"]).first
      sub_id = Subject.find_by_code(row["subject code"])


      fac_sub = where("faculty_id = ? AND subject_id = ?",fac_id,  sub_id) || FacultySubject.new
      fac_sub.faculty_id = fac_id
      fac_sub.subject_id = sub_id
      fac_sub.save!
     end # => end of do
 end # => end of def

end
