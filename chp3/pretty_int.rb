def pretty_int(value)
  decimal = Integer(value).to_s
  leader = decimal.slice!(0, decimal.length % 3)
  decimal.gsub!(/\d{3}(?!$)/,'\0,')
  decimal = nil if decimal.empty?
  leader = nil if leader.empty?
  [leader, decimal].compact.join(',')
end

pretty_int(Time.now) # => "1,409,675,235"
