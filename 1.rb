#!/usr/bin/env ruby

require 'pry'
require 'minitest'


hex = '49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d'
target = 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t'

def hex2bytes(str)
  hex_digits = %w( 0 1 2 3 4 5 6 7 8 9 A B C D E F )
  str.upcase.each_char.map { |c|
    hex_digits.index(c)
  }
end


BASE64_CHARS = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "+", "/"] 

def bytes2base64(bytes)
  bytes.each_slice(4) do |dword|
    BASE64_CHARS.index(dword.sum)
  end
end






bytes = hex2bytes(hex)
require 'pry' ; binding.pry

h = bytes2base64(bytes)


#  assert_equal target, hex2base64(hex)




