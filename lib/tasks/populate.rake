require 'csv'

namespace :populate do

  task :all   => :environment do 
    Rake::Task["populate:state"].invoke
    Rake::Task["populate:contract"].invoke
    Rake::Task["populate:company"].invoke
    Rake::Task["populate:user"].invoke
    Rake::Task["populate:unit"].invoke
    
    Rake::Task["populate:product"].invoke
    Rake::Task["populate:request"].invoke
    Rake::Task["populate:order"].invoke
    
    Rake::Task["populate:patrimony"].invoke
    Rake::Task["populate:stock"].invoke

    Rake::Task["populate:supplier"].invoke
  
  end

  task :reset_purchase_id => :environment do 
    connection = ActiveRecord::Base.connection

    models = %w(order order_category order_item product request request_item stock supplier supplier_category)

    models.each do |item|
      model   = "#{item}".classify
      last_id = "Purchase::#{model}".constantize.all.order('id DESC').first

      if last_id.present?
        number  = last_id.id + 1
        connection.execute("ALTER SEQUENCE purchase_#{item.to_s.pluralize(2)}_id_seq RESTART WITH #{number}") 
        puts number
      end

      puts item
    end
    
  end

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

  task :product => :environment do 
    CSV.foreach('lib/files/deal_products.csv', :col_sep => ',', :headers => false) do |row|
      # ["id", "title", "description", "observation", "image_path", "created_at", "updated_at"]
      #<Purchase::Product id: nil, name: nil, created_at: nil, updated_at: nil>

      product = Purchase::Product.new({
        id:   row[0],
        name: row[1]
      })

      product.save
    end
  end

  task :request => :environment do

    CSV.foreach('lib/files/deal_orders.csv', :col_sep => ',', :headers => :first_row) do |row|
      #["id", "user_id", "contract_id", "description", "status", "image_path", "created_at", "updated_at", "pdf"]
      #<Purchase::Request id: nil, contract_id: nil, requester_id: nil, description: nil, observation: nil, situation: 0, priority: 0, archive: nil, created_at: nil, updated_at: nil>

      order = Purchase::Request.new({
        id: row[0],
        requester_id: row[1],
        contract_id: row[2],
        description: row[3],
        situation: row[4],
        archive: row[8],
        created_at: row[6]
      })
      
      order.save
    end

    CSV.foreach('lib/files/deal_order_items.csv', :col_sep => '#', :headers => :first_row) do |row|
      #["id#order_id#product_id#unit#quantity#goal#observation#image_path#created_at#updated_at#machine_id#machine_version#machine_serial#contract_value"]
      #<Purchase::RequestItem id: nil, request_id: nil, product_id: nil, unit_id: nil, quantity: 0, goal: nil, observation: nil, machine_id: 0, machine_version: nil, machine_serial: nil, contract_value: nil, created_at: nil, updated_at: nil>byebug
      
      item = Purchase::RequestItem.new({
        id: row[0],
        request_id: row[1],
        product_id: row[2],
        unit: row[3],
        quantity: row[4],
        goal: row[5],
        observation: row[6],
        created_at: row[8],
        machine_id: row[10],
        machine_version: row[11],
        machine_serial: row[12],
        contract_value: row[13]
      })

      item.save 
    end
  end

  task :order   => :environment do 
    CSV.foreach('lib/files/deal_purchases.csv', :col_sep => '#', :headers => :first_row) do |row|
      #<CSV::Row "id#quotation_id#purchase_type#contract_id#description#observation#invoice_number
      #invoice_file#status#supplier_id#order_id#delivery#form_payment#deadline_payment#buy_type
      #seller#requester#carrier_id#freight#created_at#updated_at#inventory_flag#icms"
      
      #<Purchase::Order id: nil, contract_id: nil, requests_id: [], 
      # category_id: nil, order_type: 0, description: nil, observation: nil,
      # invoice_number: nil, invoice_file: nil, status: 0, supplier_id: nil, 
      # delivery: 0, form_payment: 0, deadline_payment: nil, buy_type: 0, seller: nil, 
      # requester: nil, carrier_id: nil, freight: 0, inventory: nil, icms: nil, created_at: nil, 
      # updated_at: nil>

      order = Purchase::Order.new({
        id: row[0], 
        contract_id: row[3],
        requests_id: [], 
        category_id: nil,
        order_type: row[2],
        description: row[4],
        observation: row[5],
        invoice_number: row[6],
        invoice_file: row[7],
        status: row[8],
        supplier_id: row[9], 
        delivery: row[11],
        form_payment: row[12],
        deadline_payment: row[13],
        buy_type: row[14],
        seller: row[15], 
        requester: row[16],
        carrier_id: row[17],
        freight: row[18],
        icms: row[23],
        inventory: row[22],
        created_at: row[20]
      })
  
      order.save
    end
  
    CSV.foreach('lib/files/deal_purchase_items.csv', :col_sep => ',', :headers => :first_row) do |row|
      #<CSV::Row "id":"1" "purchase_id":"1" "product_id":"1" "quantity":"6" "unit":"0" "unit_value":"25" 
      #{}"total_value":"150" "contract_value":"0" "observation":nil "created_at":"2015-09-27T21:27:59.514+00:00" 
      #{ }"updated_at":"2015-09-27T21:27:59.514+00:00">
      #<Purchase::OrderItem id: nil, order_id: nil, product_id: nil, unit_id: nil, quantity: nil, unit_value: nil,
      # total_value: nil, contract_value: nil, observation: nil, created_at: nil, updated_at: nil>

      item = Purchase::OrderItem.new({
        id: row[0],
        order_id: row[1], 
        product_id: row[2],
        unit_id: row[4],
        quantity: row[3], 
        unit_value: row[5],
        total_value: row[6],
        contract_value: row[7],
        observation: row[8],
        created_at: row[9]
      })  

      item.save
    end
  end

  task :patrimony => :environment do 
    CSV.foreach('lib/files/deal_patrimonies.csv', :col_sep => ',', :headers => :first_row) do |row|
      #["id", "title", "description", "image_path", "location", "estimated_value", "original_value",
      # "state", "contract_id", "created_at", "updated_at", "unit", "devolution_date", "number",
      # "note_number", "responsible", "quantity", "code", "buy_date"]
      #[id: nil, title: nil, description: nil, archive: nil, location: nil, estimed_value: nil,
      # original_value: nil, state: 0, contract_id: nil, unit_id: nil, quantity: 0, code: nil,
      # buy_date: nil, depreciation_month: nil, created_at: nil, updated_at: nil>
      
      

      patrimony = Purchase::Patrimony.new({
        id: row[0],
        title: row[1],
        description: row[2],
        archive: row[3],
        location: row[4],
        estimed_value: row[5],
        original_value: row[6],
        state: row[7],
        contract_id: row[8],
        unit: row[11],
        number: row[13],
        devolution_date: row[12],
        note_number: row[14],
        responsible: row[15],
        quantity: row[16],
        code: row[17],
        buy_date: row[18],
        depreciation_month: nil,
        created_at: row[9]
      })

      patrimony.save
    end
  end

  task :stock => :environment do 
  end

  task :supplier => :environment do 
    CSV.foreach('lib/files/deal_suppliers.csv', :col_sep => ',', :headers => :first_row) do |row|
      #<CSV::Row "id":"1" "name":"WL OLIVEIRA" "address":nil "address_complement":nil "cep":nil 
      #"city_id":"804" "state_id":"7" "cnpj":nil "contact_name":"-" "contact_email":nil
      # "contact_telephone":"33615500" "contact_telephone_optional":nil "contact_celphone":nil 
      # "contact_celphone_optional":nil "observation":nil "supplier_category_id":"3"
      # "created_at":"2015-09-27T21:19:19.769+00:00" "updated_at":"2015-09-27T22:54:28.205+00:00">

      #<Purchase::Supplier id: nil, name: nil, address: nil, complement: nil, cep: nil, city: nil, 
      #state_id: nil, cnpj: nil, contact_name: nil, contact_email: nil, contact_telephone: nil,
      #contact_telephone_optional: nil, contact_celphone: nil, observation: nil, category_id: nil, 
      #created_at: nil, updated_at: nil>

      supplier = Purchase::Supplier.new({
        id: row[0],
        name: row[1],
        address: row[2],
        complement: row[3],
        cep: row[4],
        state_id: row[6],
        cnpj: row[7], 
        contact_name: row[8],
        contact_email: row[9],
        contact_telephone: row[10],
        contact_telephone_optional: row[11],
        contact_celphone: row[12],
        observation: row[14],
        category_id: row[15],  
        created_at: row[16]
      })

      supplier.save
    end

    CSV.foreach('lib/files/deal_supplier_categories.csv', :col_sep => ',', :headers => :first_row) do |row|
      #<CSV::Row "id":"1" "title":"Refrigeração em Geral e Aparelhos " "status":"t" "created_at":"2015-09-27T21:18:36.762+00:00" "updated_at":"2015-09-27T21:18:36.762+00:00">
      #<Purchase::SupplierCategory id: nil, name: nil, status: true, created_at: nil, updated_at: nil>

      category = Purchase::SupplierCategory.new({
        id: row[0],
        name: row[1],
        status: row[2],
        created_at: row[3]
      })

      category.inspect
    end
  end



end