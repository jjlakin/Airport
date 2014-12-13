
require 'weather'

class Sky; include Weather; end

describe Sky do 
	
	let(:sky) {Sky.new}
	let(:plane) { double( :plane, :land! => false)}

		it 'should have clear skies by default' do
			expect(sky).not_to be_stormy
		end
		
		it 'should be able to have stormy skies' do
			sky.weather_generator(0)
			expect(sky).to be_stormy
		end



end