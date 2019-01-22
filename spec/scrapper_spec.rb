require_relative "../../spec/scrapper_spec.rb"
describe "the require line '../../db/emails.jsoné" do
it "should load the file situated in the specified path" do *
expect("require '../../db/emails.json'").to eq(File.open() 
end
end
describe "the Scrapper class" do 
it "should scrap the city council's web pages to get the email addresses and the names of the cities" do 
end
describe "the save as JSON method" do 
it "should write inside of a email.JSON file" do 
end
it "should have a length of hash superior to 100" do
expect(save_as_JSON(fichier_json).to eq(fichier_json.length > 100) #tempHash
end
it "should give a hash that has a city name in its keys" do 
expect(save_as_JSON(fichier_json)).to eq(fichier_json.key?("avernes") == true) #ville du val doise #fichier est un hash
end
describe "the save as spreadsheet method" do 
it "should write inside of a Google spreadsheet" do #en entree de ma fonction je devrais mettre le nom du fichier dans lequel la fonction ecrit
#expect(save_as_spreadsheet("email.JSON",i)).to eq(["@"].include?()) #test nul #et dans le eq je pourrais mettre des choses sur le contenu de ce fichier #par exemple le nombre de lignes
end
it "should contain more than 50 lines" do 
#expect(save_as_spreadsheet(fichier).to eq(File.open(fichier) {|f| count = f.read.count{"\n") #test de choses à propos de cette fonction #pas de test dune chaine de caracteres #il faudrait alors pouvoir avoir le nombre de lignes du fichiers en entree #le nombre de lignes nest ni en entree ni en sortie
#on veut verifier que le nombre de ligne est superieur a un dit nombre 50 mais ce nest pas le seul test
#compter les lignes na que dinteret si le fichier est un fichier texte ou se rapprochant du fichier texte avec des retours a la ligne
#un fichier spreadsheet ne contient pas de retour a la ligne 
#un fichier json ne contient pas de retour a la ligne
# seul le fichier csv pourra etre examine selon ses retours a la ligne
#en entree on veut la variable qui contient le texte
end
end
describe "the save as csv method" do 
it "should write inside of a csv file" do 
expect(save_as_csv("email.JSON")).to eq([","].include?())
end
end
