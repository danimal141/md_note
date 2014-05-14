FactoryGirl.define do
  factory :note do
    title "MyString"
    raw_body "# head1\n- list 1\n- list2"
    body ""
  end
end
