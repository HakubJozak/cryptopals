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
  c.pack('C*')
end

outs = ('A'..'Z').to_a.map do |letter|
  #letter = [ char ].pack('C')

  password = letter * secret.size
  key = (letter * 34).unpack('H*').first

  hexed = xor_hexes(secret, key)
  text  = hex2bytes(hexed).pack('C*')
  s = score2(text)
  # text = hex2bytes(hexed).pack('C*')

    puts "#{letter} / #{s}: #{text}"


  [ letter, s, text, hexed ]
end


password, score, text, hexed = outs.max { |a,b| a[1] <=> b[1] }


puts '------------------------------------'
puts "Key: #{password}"
puts "Score: #{score}"
puts hexed
puts text
