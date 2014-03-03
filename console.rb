require 'irb'

['base', 'generators', 'problems'].each do |dir_name|
  Dir.open(dir_name).each do |file|
    filename = File.join(File.expand_path(File.dirname(__FILE__)),dir_name,file)
    require(filename) if File.file?(filename)
  end
end

IRB.start
