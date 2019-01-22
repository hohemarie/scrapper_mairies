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
