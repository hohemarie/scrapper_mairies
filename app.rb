require "google_drive"
session = GoogleDrive::Session.from_config("config.json")
#ouvrir un spreadsheet à partir de ruby 
ws=session.spreadsheet_by_key("pz7XtlQC-PYx-jrVMJErTcg").worksheets[0]
p ws[2, 1]
ws[2, 1] = "foo"
ws[2, 2] = "bar"
ws.save

(1..ws.num_rows).each do |row|
	(1..ws.num_cols).each do |col|
		p ws[row, col]
	end
end

p ws.rows

ws.reload
