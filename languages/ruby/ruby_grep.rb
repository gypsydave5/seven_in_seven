filename = ARGV[0]
phrase = ARGV[1]

def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def green(text); colorize(text, 32); end
def highlight(text); colorize(text, '30;43'); end

def pretty_match(line, line_number, phrase)
  "#{green(line_number + 1)}> #{line.gsub(phrase, highlight(phrase))}"
end

IO.readlines(filename).each_with_index do |line, line_number|
  puts pretty_match(line, line_number, phrase) if line.include? phrase
end
