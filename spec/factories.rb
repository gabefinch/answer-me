FactoryGirl.define do
  factory(:user) do
    username('golem@golem.org')
    password('password')
  end
  factory(:question) do
    title('WTF?')
    body('Why is my computer screen black?')
  end
  factory(:response) do
    body('Press the power button.')
  end

end
