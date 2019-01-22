require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'scrapper'

Scrapper.new.perform

cli = HighLine.new
answer = cli.choose do |menu|
  menu.prompt = "Please choose your favorite programming language?  "
  menu.choice(:ruby) { say("Good choice!") }
  menu.choices(:python, :perl) { say("Not from around here, are you?") }
end
