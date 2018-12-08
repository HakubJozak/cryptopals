module English

  FREQUENCY_TABLE =   {
    ' ' =>      5,
    '*' =>      -1,
    'E' =>	12.02,
    'T' =>	9.10,
    'A' =>	8.12,
    'O' =>	7.68,
    'I' =>	7.31,
    'N' =>	6.95,
    'S' =>	6.28,
    'R' =>	6.02,
    'H' =>	5.92,
    'D' =>	4.32,
    'L' =>	3.98,
    'U' =>	2.88,
    'C' =>	2.71,
    'M' =>	2.61,
    'F' =>	2.30,
    'Y' =>	2.11,
    'W' =>	2.09,
    'G' =>	2.03,
    'P' =>	1.82,
    'B' =>	1.49,
    'V' =>	1.11,
    'K' =>	0.69,
    'X' =>	0.17,
    'Q' =>	0.11,
    'J' =>	0.10,
    'Z' =>	0.07,
  }

  def frequencies_in(txt)
    table = {}
    src = txt.upcase

    ('A'..'Z').each do |char|
      table[char] = src.count(char) / txt.size.to_f
    end

    table
  end

  def english(char)
    FREQUENCY_TABLE[char.upcase] || 0
  end

  def score3(text)
    total = 0

    text.upcase.each_char do |char|
      total += FREQUENCY_TABLE.fetch(char, -6)
    end

    total / text.size.to_f
  end

  def score2(text)
    total = 0
    src = text.upcase
    
    FREQUENCY_TABLE.keys.each do |char|
      total += src.count(char) * FREQUENCY_TABLE[char]
    end

    total / text.size.to_f
  end

  def score(text)
    local = frequencies_in(text)
    total = 0.0

    FREQUENCY_TABLE.each do |letter,f|
      total += (local.fetch(letter,0) - f) ** 2
    end
    
    total
  end
end
