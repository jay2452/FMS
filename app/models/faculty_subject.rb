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
      fac_id = Faculty.where("name = ?", row["name"]).first
      sub_id = Subject.find_by_code(row["subject code"])

      puts "++++++++++++++++"
        p row["emp id"]
        p row["name"]
        p fac_id.id
        p sub_id.id
      puts "++++++++++++++++"


      fac_sub = where("faculty_id = ? AND subject_id = ?",fac_id.id,  sub_id.id).first || FacultySubject.new
      fac_sub.faculty_id = fac_id.id
      fac_sub.subject_id = sub_id.id
      fac_sub.save!
     end # => end of do
 end # => end of def

end
