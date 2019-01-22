require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'scrapper'

Scrapper.new.perform

cli = HighLine.new
answer = cli.choose do |menu|
  menu.prompt = "Please choose your favorite format for output?  "
  menu.choice(:json) { save_as_JSON(fichier_json) }
  menu.choice(:spreadsheet) { save_as_spreadsheet(sheet) }
  menu.choice(:csv) {save_as_csv(fichier_csv) }
end
