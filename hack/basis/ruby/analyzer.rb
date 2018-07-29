puts '------------------------------------------------'
File.open('test.txt').each { |line| puts line}
puts '------------------------------------------------'
line_count = 0
File.open('test.txt').each { line_count += 1 }
puts line_count
puts '------------------------------------------------'
text = ''
line_count = 0
File.open('test.txt').each do |line|
    line_count += 1
    text << line
end
puts "#{line_count} lines"
puts '------------------------------------------------'
total_characters = text.length
puts "#{total_characters} characters"
puts '------------------------------------------------'
total_characters_nospaces = text.gsub(/\s+/, '').length
puts "#{total_characters_nospaces} characters excluding spaces"
puts '------------------------------------------------'
word_count = text.split.length
puts "#{word_count} words"
puts '------------------------------------------------'
paragraph_count = text.split(/\n\n/).length
puts "#{paragraph_count} paragraphs"
sentence_count = text.split(/\.|!|\?/).length
puts "#{sentence_count} sentences"
puts '------------------------------------------------'