require 'pry'

def recursive &block
  unless @requests
    return start &block
  end
  f = Fiber.new &block
  @requests << f
  Fiber.yield :continue
  @result
end

def start &block
  @requests = []
  f = Fiber.new{block.call}
  @requests << f
  until @requests.empty? do
    f = @requests.last
    next unless f
    res = f.resume
    if res != :continue
      @result = res
      @requests.pop
    end
  end
  @result
ensure
  @requests = nil
  @result = nil
end

def fib_ok a, memo={0 => 0, 1 => 1}
  return memo[a] if memo[a]
  memo[a-1] ||= recursive { fib_ok a-1, memo }
  memo[a-2] ||= recursive { fib_ok a-2, memo }
  memo[a-1] + memo[a-2]
end

def fib_err a, memo={0 => 0, 1 => 1}
  return memo[a] if memo[a]
  memo[a-1] ||= fib_err a-1, memo
  memo[a-2] ||= fib_err a-2, memo
  memo[a-1] + memo[a-2]
end

raise unless 100.times.all?{|i|fib_ok(i)==fib_err(i)}
p fib_ok(10000) #=> 2090桁の数字
p fib_err(10000) #=> stack level too deep