require 'csv'

namespace :populate do

  task :state => :environment do 

    CSV.foreach('lib/files/state.csv', :col_sep => ',') do |row|
      state = Core::State.new

      state.id      = row[0]
      state.name    = row[1]
      state.acronym = row[2]
      state.save
    end
  end

  task :contract => :environment do 
    CSV.foreach('lib/files/contract.csv', :col_sep => ',') do |row|

      contract = Core::Contract.new
      contract.id         = row[0]
      contract.company_id = row[3]
      contract.name       = row[1]

      contract.save!
    end   
  end

  task :company  => :environment do 
    CSV.foreach('lib/files/company.csv', :col_sep => ',') do |row|

      company = Core::Company.new
      company.id       = row[0]
      company.name     = row[1]
      company.cnpj     = row[2]
      company.state_id = row[4]
      company.address  = row[5]
      company.city     = row[6]
      company.cep      = row[7]

      company.save!
    end 
  end

  task :user => :environment do 
    CSV.foreach('lib/files/user.csv', :col_sep => ',') do |row|

      if row[13] == "1"
        user = Core::Requester.new
      else
        user = Core::User.new
        user.administrator = true
      end

      user.id        = row[0]
      user.email     = row[1]
      user.name      = row[11]
      user.password  = 'ex123456789'
      user.password_confirmation = 'ex123456789'

      user.save!
    end 
  end

  task :unit => :environment do 
    %w(UN CX CM LT GR).each do |item|
      unit = Purchase::Unit.new
      unit.name = item
      unit.save
    end
  end

end