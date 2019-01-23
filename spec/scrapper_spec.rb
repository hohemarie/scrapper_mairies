require_relative "../spec/scrapper_spec.rb"

describe "the save as JSON method" do 

	it "should write inside of a email.JSON file" do 
		
		expect(save_as_JSON("http://www.annuaire-des-mairies.com/val-d-oise.html")).to eq(File.open("../../emails.JSON","w"))

	end

	it "should have a length of hash superior to 100" do
		
		expect(save_as_JSON(fichier_json)).to eq(self.length > 100)
	
	end
	
	it "should give a hash that has a city name in its keys" do 
		
		expect(save_as_JSON(fichier_json)).to eq(fichier_json.key?("avernes") == true) #ville du val doise #fichier est un hash
	
	end

end

describe "the save as spreadsheet method" do 
	
	it "should write inside of a Google spreadsheet several lines of data" do 
		
		expect(save_as_spreadsheet(sheet)).to eq(sheet.last_row>50)#require 'roo'
	
	end
	
	it "should write the name of city councils and email addresses on two columns next to each other" do 
		
		expect(save_as_spreadsheet(sheet)).to eq(sheet.last_column-sheet.first_column==1)
	
	end

	it "should write name of cities in the first column of the data file" do
		
		expect(save_as_spreadsheet(sheet)).to eq(liste_de_villes.include?(sheet.cell(20,2))==true)
	
	end
	
	it "should make the cells on the right column contain @ symbols" do 

		expect(save_as_spreadsheet(sheet)).to eq(['@'].include?(sheet.cell(2,3)))

	end
	
	it "should open and write into a spreadsheet without returning the spreadsheet empty" do
		
		expect(save_as_spreadsheet(sheet)).to eq(empty?(sheet)==false)
	
	end
end

describe "the save as csv method" do 
	
	it "should write several lines inside of a csv file" do 
		
		expect(save_as_csv("email.JSON")).to eq(File.open("email.JSON") {|f| f.read.count("\n")>100})

	end
	
	it 'should write several lines and separate the data with commas, one by line' do
		
		expect(save_as_csv('email.JSON')).to eq(File.open('email.JSON') {|f| f.read.count(",")>100}) 
	
	end

end
