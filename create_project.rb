require 'xcodeproj'
require 'trollop'

opts = Trollop::options do
  opt :name, "The name of the project", type: String  
end

name = opts[:name]

Trollop::die :name, "name must be specified" if name.nil?

puts opts

proj = Xcodeproj::Project.new("#{name}.xcodeproj")

app_target = proj.new_target(:application, 'App', :ios, '8.0')
header_ref = proj.main_group.new_file('./Class.h')
implm_ref = proj.main_group.new_file('./Class.m')
app_target.add_file_references([implm_ref])

proj.save
