
local BaseN = {}

local function BaseN.new(N)
	local Base = {}
	
	Base.Encode = function(Number)
		local Encoded = {}
		
		while Number > 0 do
			table.insert(Encoded, 1, (Number % N))
			
		    Number = math.floor(Number / N)
		end
		
		return string.char(table.unpack(Encoded))
	end
	
	Base.Decode = function(String)
		local Table = {string.byte(String, 1, -1)}
		
		local Decoded = 0
		for Index = 1, #Table do
			Decoded = Decoded + Table[#Table - Index + 1] * N ^ (Index - 1) 
		end
		
		return Decoded
	end
	
	return Base
end

return BaseN
