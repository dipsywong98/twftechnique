if stack == nil then
	stack = {}
	stack.__index = stack
end

function stack.new ()
	local self = setmetatable({},stack)
	stack.elements = {}
	stack.size = 0 
	return self
end

function stack.push(self,data_in)
	self.size = self.size + 1
	self.elements[self.size] = data_in
end

function stack.pop(self)
	if self.size == 0 then return false end
	self.elements[self.size] = nil
	self.size = self.size - 1
end

function stack.top(self)
	if self.size > 0 then
		return self.elements[self.size]
	else return false
	end
end

function stack.empty(self)
	if self.elements[1] == nil then return true
	else return false end
end