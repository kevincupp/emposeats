module Enumerable
  def average
    self.sum / self.size
  end

  def std_dev
    average = self.average
    std_dev = 0

    self.each do |n|
      n -= average
      n **= 2
      std_dev += n
    end

    Math.sqrt(std_dev / self.size).round
  end
end
