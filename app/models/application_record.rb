class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.open_spreadsheet file
    case File.extname file.original_filename
    when ".csv" then Roo::Csv.new file.path
    when ".xls" then Roo::Excel.new file.path
    when ".xlsx" then Roo::Excelx.new file.path
    else raise "Unknown file type: #{fle.original_filename}"
    end
  end

  
end
