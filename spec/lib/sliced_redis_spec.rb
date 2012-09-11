require_relative '../spec_helper'

describe SlicedRedis do
  let( :redis ) { Redis.new }
  let( :key ) { "test" }
  let( :small_value ) { "foo" }
  let( :large_value ) { "x" * 1024 * 1024 }

  after :each do
    redis.del key
  end

  it "handles small set" do
    SlicedRedis.set( redis, key, small_value )
    redis.get( key ).should == small_value
  end

  it "handles large set" do
    SlicedRedis.set( redis, key, large_value )
    redis.get( key ).should == large_value
  end

  it "doesn't append to old value" do
    2.times { SlicedRedis.set( redis, key, small_value ) }
    redis.get( key ).should == small_value
  end

  it "handles small setex" do
    SlicedRedis.setex( redis, key, 10, small_value )
    redis.get( key ).should == small_value
    redis.ttl( key ).should == 10
  end

  it "handles large setex" do
    SlicedRedis.setex( redis, key, 10, large_value )
    redis.get( key ).should == large_value
    redis.ttl( key ).should == 10
  end
end

