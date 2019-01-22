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
expect(save_as_JSON(fichier).to eq(fichier.length > 100) #tempHash
end
it "should give a hash that has a city name in its keys" do 
expect(save_as_JSON(fichier)).to eq(fichier.key?("avernes") == true) #ville du val doise #fichier est un hash
end
describe "the save as spreadsheet method" do 
it "should write inside of a Google spreadsheet" do
expect(save_as_spreadsheet("email.JSON",i)).to eq(["@"].include?())
end
end
describe "the save as csv method method" do 
it "should write inside of a csv file" do 
expect(save_as_csv("email.JSON")).to eq([","].include?())
end
end
