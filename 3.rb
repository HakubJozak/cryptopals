#!/usr/bin/env ruby

# Fixed XOR
# Write a function that takes two equal-length buffers
# and produces their XOR combination.
#
# If your function works properly, then when you feed it the string:
#
# 1c0111001f010100061a024b53535009181c
#
# ... after hex decoding, and when XOR'd against:
#
# 686974207468652062756c6c277320657965
# ... should produce:
#
# 746865206b696420646f6e277420706c6179
#

require 'pry'
require 'minitest'
require_relative 'cryptopals'
require_relative 'english'

include Cryptopals
include English

secret = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"

def xor(a,b)
  c = (hex2bytes(a).zip(hex2bytes(b))).map { |x,y| x ^ y }
  require 'pry' ; binding.pry
  c.pack('C*')
end

outs = [ ('a'..'z').to_a, ('A'..'Z').to_a ].flatten.map do |letter|
  password = letter * secret.size 
  
  hexed = xor_hexes(secret, password)
  text  = hex2bytes(hexed).pack('C*')

  # text = hex2bytes(hexed).pack('C*')

  [ letter, score(text), text, hexed ]
end



puts outs

password, score, text, hexed = outs.max { |a,b| a[1] <=> b[1] }


puts "Key: #{password}"
puts "Score: #{score}"
puts hexed
puts text







