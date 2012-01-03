torquebox-no-op
===============

The torquebox-no-op Gem is a mock library that allows you to run TorqueBox applications without the TorqueBox server. It
provides definitions for many TorqueBox methods and classes, but does not actually implement them.  This allows a
TorqueBox application to *run*, but not necessarily *work*.

This library is primarily intended to facilitate unit testing, where as [TorqueSpec](https://github.com/torquebox/torquespec)
handles integration testing.  But it could be used to run an application (probably just in development) using WEBrick or
some such server.  It could even be used to run under MRI!

## How to use it
Add this to your Gemfile:

    group :test do
      ...
      gem 'torquebox-no-op', :git => "git://github.com/jkutner/torquebox-no-op.git"
    end

    group :development, :production do
      gem "torquebox-rake-support"
      gem "torquebox"
    end

It's important that you don't load both the torquebox-no-op Gem and the regular torquebox Gem since they define the
same methods.

## Example
Let's say we have a model in our application like this:

    class User < ActiveRecord::Base

        ...

        def send_welcome_email
            # sending an email can take a while
        end

        always_background :send_welcome_email
    end

This model takes advantage of TorqueBox's `Backgroundable` class and its `always_background` method.  But let's say we
also have the following spec:

    describe User do
        subject do
            User.create
        end

        it "should exist" do
            subject.should_not be_nil
        end
    end

If we try to run this with `rspec`, we'll end up with the following error:

    $ rspec spec/
    NoMethodError: undefined method `always_background' for #<Class:0x7ef66a35>
          method_missing at org/jruby/RubyBasicObject.java:1677
          method_missing at ~/.rvm/gems/jruby-1.6.5/gems/activerecord-3.1.1/lib/active_record/base.rb:1088

But with torquebox-no-op Gem, we can modify our Gemfile like so:

    group :test do
      ...
      gem 'torquebox-no-op', :git => "git://github.com/jkutner/torquebox-no-op.git"
    end

    group :development, :production do
      gem "torquebox-rake-support"
      gem "torquebox"
    end

After running a `bundle install` our spec will run!

