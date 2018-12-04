FactoryBot.define do
  factory :user_file do |f|
    f.first_name {"John"}
    f.last_name {"Doe"}
    f.email {'xainbutt28@gmail.com'}
    f.phone_no {'03224325175'}
    f.address {'Some address'}
    f.program {'some program'}
    f.fee {5.00}
    f.discount {2.00}
    f.ssn {'ssn'}
    f.dob {Date.current.in_time_zone}
    f.placement_date {Date.current.in_time_zone}
    f.payment_status_color {'yellow'}
  end
end