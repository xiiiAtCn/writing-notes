require 'rubygems'
require 'RedCloth'
r = RedCloth.new('this is a *test* of _using RedCloth_')
puts r.to_html