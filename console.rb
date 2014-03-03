require 'irb'

# require generators
Dir.open('generators').each do |file|
  filename = File.join(File.expand_path(File.dirname(__FILE__)),'generators',file)
  require(filename) if File.file?(filename)
end

IRB.start
