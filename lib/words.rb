module Words
  def self.extract(site_text)
    site_text.scan(/[a-zA-Z\-\']+/)
  end

  def self.frequency(site_text)
    extract(site_text).inject(Hash.new(0)) do |hash, word|
      hash[word] += 1
      hash
    end
  end
end
