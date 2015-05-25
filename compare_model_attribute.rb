test 'should create a care and correct attributes' do
  
  car = Car.new(@car_params)
  
  car.expects(:save).returns(true)    
  assert car.save
  
  expected = @car_params
  assert_equal expected, car.attributes.symbolize_keys.slice(*expected.keys)    
end