require_relative "../spec/scrapper_spec.rb"

describe "the save as JSON method" do 

	it "should write inside of a email.JSON file" do 
		
		expect(save_as_JSON("http://www.annuaire-des-mairies.com/val-d-oise.html")).to eq(File.open("../../emails.JSON","w"))

	end

	it "should have a length of hash superior to 100" do
		
		expect(save_as_JSON(fichier_json)).to eq(self.length > 100) #tempHash
	
	end
	
	it "should give a hash that has a city name in its keys" do 
		
		expect(save_as_JSON(fichier_json)).to eq(fichier_json.key?("avernes") == true) #ville du val doise #fichier est un hash
	
	end

end

describe "the save as spreadsheet method" do 
	
	it "should write inside of a Google spreadsheet several lines of data" do #en entree de ma fonction je devrais mettre le nom du fichier dans lequel la fonction ecrit
#expect(save_as_spreadsheet("email.JSON",i)).to eq(["@"].include?()) #test nul #et dans le eq je pourrais mettre des choses sur le contenu de ce fichier #par exemple le nombre de lignes
		
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
#Roo can access the contents of various spreadsheet files. It can handle * OpenOffice * Excelx * LibreOffice * CSV


#it "should contain more than 50 lines" do 
#expect(save_as_spreadsheet(fichier).to eq(File.open(fichier) {|f| count = f.read.count{"\n") #test de choses à propos de cette fonction #pas de test dune chaine de caracteres #il faudrait alors pouvoir avoir le nombre de lignes du fichiers en entree #le nombre de lignes nest ni en entree ni en sortie
#on veut verifier que le nombre de ligne est superieur a un dit nombre 50 mais ce nest pas le seul test
#compter les lignes na que dinteret si le fichier est un fichier texte ou se rapprochant du fichier texte avec des retours a la ligne
#un fichier spreadsheet ne contient pas de retour a la ligne 
#un fichier json ne contient pas de retour a la ligne
# seul le fichier csv pourra etre examine selon ses retours a la ligne
#en entree on veut la variable qui contient le texte
#end
end

describe "the save as csv method" do 
	
	it "should write several lines inside of a csv file" do 
		
		expect(save_as_csv("email.JSON")).to eq(File.open("email.JSON") {|f| f.read.count("\n")>100})

#expect(save_as_csv("email.JSON")).to eq([","].include?())
	end
	
	it 'should write several lines and separate the data with commas, one by line' do
		
		expect(save_as_csv('email.JSON')).to eq(File.open('email.JSON') {|f| f.read.count(",")>100}) 
	
	end

end
