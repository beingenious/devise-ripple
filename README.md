## devise-ripple

An "ORM" strategy to use Devise with Riak (through the Ripple Ruby client)

So far, it is in a usable state *for me*, in the following environment:

 * gem 'rails', '3.2.14'
 * gem 'ripple', :git => 'git@github.com:beingenious/ripple.git'
 * gem 'orm_adapter', :git => 'git@github.com:beingenious/orm_adapter.git'
 * gem 'devise', '2.2.7'

### Usage

 * Place ripple.rb in your project so as to get: `RAILS_ROOT/lib/devise/orm/ripple.rb`
 * In your `RAILS_ROOT/config/initializers/devise.rb` make sure to have `require 'devise/orm/ripple'`

### Example User model

  ```ruby
    class User
      include Ripple::Document

      devise :database_authenticatable, :registerable,
             :recoverable, :rememberable, :trackable, :validatable

      ## Database authenticatable
      property :email,              :type => String, :default => ""
      property :encrypted_password, :type => String, :default => ""

      property :firstname, :type => String, :default => ""
      property :lastname, :type => String, :default => ""

      ## Recoverable
      property :reset_password_token,   :type => String
      property :reset_password_sent_at, :type => Time

      ## Rememberable
      property :remember_created_at, :type => Time

      ## Trackable
      property :sign_in_count,      :type => Integer, :default => 0
      property :current_sign_in_at, :type => Time
      property :last_sign_in_at,    :type => Time
      property :current_sign_in_ip, :type => String
      property :last_sign_in_ip,    :type => String

      index :email, String # optimised with orm_adapter and second indexes

      timestamps!

    end
  ```

### That said, this is work in progress - please do fork and contribute!