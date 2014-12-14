require 'airport'
require 'plane'

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  # let(:plane) { double( :plane, :land! => false)}
  # let(:sky) { double( :sky, :stormy => false,  )}
  # let(:stormy_sky) { double( :stormy_sky, :stormy => true,  )}

  def fill_airport
		6.times {airport.accept(plane)}
  end

	def stormy_weather
		airport.weather_generator(0)
	end

  context 'taking off and landing' do

  	it 'should have a planes storage' do
  		
  	end

    it 'a plane can land' do
			expect(airport.planes.count).to eq(0)
			airport.accept(plane)
			expect(airport.planes.count).to eq(1)
    end

    it 'a plane can take off' do
			airport.accept(plane)
			airport.launch(plane)
			expect(airport.planes.count).to eq(0)
    end
  end

  context 'traffic control' do

  	it 'knows when it is full' do
			
			fill_airport
			expect(airport.planes_count).to eq(6)
  		expect(airport.full).to eq(true)

  	end

    it 'a plane cannot land if the airport is full' do
			
			fill_airport
			expect(lambda{airport.accept(plane) }).to raise_error(RuntimeError, 'the plane storage is full')
			
			
			
    end

    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
	
    context 'weather conditions' do

    	it 'should be able to have ' do

	    	stormy_weather
	      expect(airport).to be_stormy
	    
	    end

      it 'a plane cannot take off when there is a storm brewing' do
				
				airport.accept(plane)
				stormy_weather
				expect(lambda {airport.launch(plane) }).to raise_error(RuntimeError, 'there is a storm brewing, please don\'t leave')
				

      end

      it 'a plane cannot land in the middle of a storm' do
				
				stormy_weather
				expect(lambda {airport.accept(plane)}).to raise_error(RuntimeError, 'it\'s a tad windy' )

	
      end

			it 'should change the status of the landed planes to landed' do

				airport.accept(plane)
				expect(plane).not_to be_flying

    	end

    	it 'should change to flying after take off' do
				airport.accept(plane)
				airport.launch(plane)
				expect(plane).to be_flying
    	end

    end
  end
end

# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"

describe Plane do

  let(:plane) { Plane.new }

  

  it 'has a flying status when created' do
	
  end

  it 'has a flying status when in the air' do

  end

  it 'can take off' do

  end

  it 'changes its status to flying after taking of' do

  end
end

# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

describe "The grand finale (last spec)" do


  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  

  def fill_airport
		6.times {airport.accept(plane)}
  end

	def stormy_weather
		airport.weather_generator(0)
	end

	it 'should fill the airport' do
		airport.fill_airport_with_weather(plane)
		expect(airport.planes_count).to eq(6)
	end
	

  it 'all planes can land and all planes can take off' do
		
		airport.fill_airport_with_weather(plane)
		airport.empty_airport_with_weather
		expect(airport.landing_information["landing_confirmation"]).to eq(6)
		# expect(flight_log).not_to be_flying
		expect(airport).to be_empty
		
		


  end
end
