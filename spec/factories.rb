Factory.define :user do |user|
  user.name "Micheal Hartl"
  user.email "mhartl@example.com"
  user.password "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :micropost do |n|
  micropost.contents "Foo bar"
  micropost.association :user
end