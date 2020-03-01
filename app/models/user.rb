class User < ActiveRecord::Base
  has_secure_password
  has_many :products


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  after_create :send_welcome_email

  unless ActiveRecord::Base.connection.table_exists?('users')
    connection.create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end

  private

  def send_welcome_email
    puts 'Send welcome email'
  end
end

  
