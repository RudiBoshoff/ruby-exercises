# LOAD CONTENTS OF FILE AT DIRECTORY INTO THIS FILE
require "./string_extentions"

# LOAD CONTENTS OF FILE IN CURRENT DIRECTORY INTO THIS FILE
require_relative "string_extentions"

# LOAD CONTENTS OF EXTERNAL FILE INTO THIS FILE
load "string_extentions.rb"
puts "This is a test".vowels.join("-")
