require 'json'
entries = JSON.parse(File.read('_dictionnary.json'))


entries.each do |entry|
  part = entry['part']
  type = entry['type']
  pattern = entry['pattern']

  if part.eql?('extension')
    extension = type.eql?('regex') ? pattern.gsub('\\','/').gsub('A.*','secret').gsub('/','').to_s : pattern
    file = "secret.#{extension}"
  elsif part.eql?('filename')
    filename = type.eql?('regex') ? pattern.gsub('\\','/').gsub('A.*','secret').gsub('/','').to_s : pattern
    file = filename
  end
  next if file == nil
  out_file = File.new(file, 'w')
  out_file.puts("
AWS_ACCESS_KEY_ID=cool_hackers_go_to_https://hey.network
AWS_SECRET_ACCESS_KEY=cool_hackers_go_to_https://hey.network
SECRET=cool_hackers_go_to_https://hey.network
PASSWORD=cool_hackers_go_to_https://hey.network
PASSWD=cool_hackers_go_to_https://hey.network
PRIVATE_KEY=cool_hackers_go_to_https://hey.network
CREDENTIALS=cool_hackers_go_to_https://hey.network
password=cool_hackers_go_to_https://hey.network
pwd=cool_hackers_go_to_https://hey.network
PWD=cool_hackers_go_to_https://hey.network
  ")
  out_file.close
end
