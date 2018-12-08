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

include Cryptopals

a = '1c0111001f010100061a024b53535009181c'
b = '686974207468652062756c6c277320657965'
target = '746865206b696420646f6e277420706c6179'

def info(name, value)
  puts name
  puts '------------------------'
  puts value
  puts hex2bytes(value).pack('C*')
  puts '------------------------'
end

xored = (hex2bytes(a).zip(hex2bytes(b))).map { |x,y| x ^ y }
c = xored.pack('C*').unpack('H*').first

info('A', a)
info('B', b)


puts 'C'
puts c
puts 'YAY!' if c == target

