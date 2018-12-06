#!/usr/bin/env ruby

require 'pry'
require 'minitest'

source = '49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d'
target = 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t'

BASE64_CHARS = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "+", "/"]

def hex2bytes(str)
  str.upcase.scan(/.{2}/).map { |c|
    c.to_i(16)
  }
end

def bytes2base64(bytes)
  binary = bytes.map { |b| ("%08b" % b).split('') }.flatten

  binary.each_slice(6).map do |sextet|
    value = sextet.join.to_i(2)
    BASE64_CHARS[value]
  end.join
end



bytes = hex2bytes(source)
puts bytes2base64(bytes)

