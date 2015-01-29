class Scorer
	MAX_SCOREABLE_FRAME = 10
	
	def initialize
		@visits = 0
		@score = 0
		@bonus = 0
		@strike_bonified_visits = Array.new
		@spare_bonified_visits = Array.new
	end

	def compute frame
		@visits += 1
		compute_score frame
		compute_bonus frame
	end

	def score
		@score + @bonus	
	end

	private

	def compute_score frame
		@score += frame.score if scoreable?
	end

	def compute_bonus frame
		compute_spare_bonus frame
		compute_strike_bonus frame
	end

	def compute_spare_bonus frame
		@bonus += frame.spare_bonus if spare_bonus_active?
		spare_bonify_next if frame.spare?	
	end

	def compute_strike_bonus frame
		@bonus += frame.score if strike_bonus_active?	
		strike_bonify_next if frame.strike?
		spare_bonify_next if double_strike_at_tenth?(frame)
	end

	def double_strike_at_tenth? frame
		strike_bonus_active? && frame.strike? && scoreable?
	end

	def strike_bonify_next
		@strike_bonified_visits.push(@visits + 1)	
	end

	def spare_bonify_next
		@spare_bonified_visits.push(@visits + 1)
	end

	def spare_bonus_active?
		@spare_bonified_visits.include?(@visits)
	end

	def strike_bonus_active?
		@strike_bonified_visits.include?(@visits)
	end

	def scoreable?
    @visits <= MAX_SCOREABLE_FRAME 
  end
  
end