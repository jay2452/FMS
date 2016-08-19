class StudentSubject < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  belongs_to :semester
  belongs_to :section

  def self.import(file)
    spreadsheet = open_spreadsheet(file)   # => defined in ApplicationRecord.rb file
    header = spreadsheet.row 1
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # if row["code"].empty? == false
        # subject = find_by_code(row["code"])
      # else

      # end

        user_roll = row["student roll"].to_i
        user_id = User.find_by_roll(user_roll).id

        section_name = row["section"]
        section_id = Section.find_by_name(section_name).id

        semester = row["semester"]
        semester_id = Semester.find_by_number(semester).id

        subject_code_arr = row["subject code"].split(",")

        subject_code_arr.each do |code|
          user_subject = StudentSubject.new
          user_subject.user_id = user_id
          user_subject.section_id = section_id
          user_subject.semester_id = semester_id
          user_subject.subject_id = Subject.find_by_code(code.strip).id
          user_subject.save!
        end
    end
  end

end
