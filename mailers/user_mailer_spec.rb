require 'rails_helper'

describe UserdMailer do 

  let(:lead) { ValuationLead.new({  
      
      full_name: 'Chris Joannou', 
      email: 'chris@test.com',
      phone_number: '1112223333',
      company_name: 'Airbnb ',
      
    }) }

  let(:mail) { UserMailer.to_user(lead) }
  
  describe "#to_user" do
    it "should send the lead to the email" do
      mail.subject.should match("Your Request for Offers")
      mail.to.should eq(['chris@test.com'])
      mail.from.should eq(['customersupport@test.com'])
      mail.body.encoded.should match("Thank you for using")
    end
  end

end