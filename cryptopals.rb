module Cryptopals

  # TODO: use unpack
  def hex2bytes(str)
    str.upcase.scan(/.{2}/).map { |c|
      c.to_i(16)
    }
  end

  def xor_hexes(a,b)
    c = (hex2bytes(a).zip(hex2bytes(b))).map { |x,y| x ^ y }
     c.pack('C*').unpack('H*').first
  end

  def bytest2binary(bytes)
    hex2bytes(a)
  end

  def bytes2base64(bytes)
    binary = bytes.map { |b| ("%08b" % b).split('') }.flatten

    binary.each_slice(6).map do |sextet|
      value = sextet.join.to_i(2)
      BASE64_CHARS[value]
    end.join
  end
  
end
