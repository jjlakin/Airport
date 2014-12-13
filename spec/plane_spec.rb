require 'plane'

	describe Plane do

		let(:plane) {Plane.new}
		let(:airport) { double( :airport, :class => Airport )}

		it 'should by default on the ground' do
			expect(plane).to be_flying
		end

		it 'should be able to fly' do 
			plane.land!
			expect(plane).not_to be_flying
		end

			
		end


