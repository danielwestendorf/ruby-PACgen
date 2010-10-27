#This script will generate proxy configuration files from the erb template in the same directory for each of the locations specified
require 'erb'
require 'tempfile'


#add new locations/proxies here
configs = [
	{:file_name => "EastCoast", :proxy => "123.123.123.123:8080"},
	{:file_name => "WestCoast", :proxy => "321.321.321.321:8080"}

@alternate_proxy = "123.123.123.543:8080" # this is the alternate proxy

template = ERB.new File.read("proxy.erb") #this is the PAC file template
date = Time.now.to_i #timestamp
release_path = "/var/www/proxy/releases/#{date}" #path we want to store our releases to, so that we can roll back to a safe version if we screw up

puts "Test only? (Y/N)"
test = gets.chomp.downcase #ask the user if this should be test only?

current_path = "/var/www/proxy/current" #set the path where the web server serving the PAC files is pointed to

if !Dir.exist?(release_path)
   Dir.mkdir(release_path)
end

#go through each config
configs.each do |config|
	file_name = config[:file_name]
	@proxy = config[:proxy]
	temp = Tempfile.open("all")
	temp.write(template.result) #write the template to a tmp file
	temp.rewind
	system("cat #{temp.path} | ruby jsmin.rb > #{release_path}/proxy_#{file_name}.pac") #minify with jsmin.rb
end

if test == "n"
	File.unlink(current_path) if File.exist?(current_path) && File.symlink?(current_path) #unlink the previous release_path
	File.symlink(release_path, current_path) #link the newest release_path with the current
end

current_path = current_path + "/test"	#Don't forget to link the test files!
File.unlink(current_path) if File.exist?(current_path) && File.symlink?(current_path)
File.symlink(release_path, current_path)
