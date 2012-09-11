require "sliced_redis/version"

class SlicedRedis
  class << self
    def set( redis, key, value )
      redis.multi do
        redis.del key
        chunked_append redis, key, value
      end
    end

    def setex( redis, key, expiration, value )
      redis.multi do
        redis.del key
        chunked_append redis, key, value
        redis.expire key, expiration
      end
    end

    # Append value to the given key in 50kb chunks.
    def chunked_append( redis, key, value )
      value.scan( /.{1,51200}/ ) do |chunk|
        redis.append key, chunk
      end
    end
  end
end
