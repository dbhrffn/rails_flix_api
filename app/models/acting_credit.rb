class ActingCredit < Credit
    # Ensure the association with person is set up correctly
    alias_attribute :character, :role
  
    def self.top_billing(n=5)
      includes(:person).first(n)
    end
  end