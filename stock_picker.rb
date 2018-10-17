def stock_picker(stock_prices)
  puts 'The stock prices for the week were:'

  stock_prices.each.with_index do |price, day|
    puts "Day #{day} = R #{price}"
  end

  puts ''
  max_profit = 0
  min_day = 0
  max_day = 0
  min = 0
  max = 0
  day = 0
  stock_size = stock_prices.size

  while day < stock_size
    day_after = day + 1
    while day_after < stock_size
      if  (stock_prices[day_after] - stock_prices[day]) > max_profit
        min = stock_prices[day]
        max = stock_prices[day_after]
        min_day = day
        max_day = day_after
        max_profit = max - min
      end
      day_after += 1
    end
    day += 1
  end

  puts "The maximum profit that could of been obtained was R#{max_profit} per share, if you purchased a share on day #{min_day} for a value of R#{min} and then sold the share on day #{max_day} for a value of R#{max}."
  puts ''
end

prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
stock_picker(prices)
prices = [3, 2, 2, 9, 15, 7, 5, 19, 1]
stock_picker(prices)
