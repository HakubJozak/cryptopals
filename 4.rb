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


winners = File.read('4.txt').lines.map.with_index do |secret, line_number|
  
  outs = ('A'..'Z').to_a.map do |letter|
    #letter = [ char ].pack('C')

    password = letter * secret.size
    key = (letter * 34).unpack('H*').first

    hexed = xor_hexes(secret, key)
    text  = hex2bytes(hexed).pack('C*')
    s = score2(text)
    # text = hex2bytes(hexed).pack('C*')

    # puts "#{letter} / #{s}: #{text}"


    [ letter, s, text, hexed ]
  end


  password, score, text, hexed = outs.max { |a,b| a[1] <=> b[1] }

  # puts "#{line_number} / #{score}: #{text}"
  # puts '------------------------------------'
  # puts "Key: #{password}"
  # puts "Score: #{score}"
  # puts hexed
  # puts text
  puts "#{line_number} / #{score}: #{text}"

  [ score, line_number, text ]
end

#puts winners.max { |a,b| a.first <=> b.first }.inspect

