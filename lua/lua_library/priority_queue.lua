if priority_queue == nil then
	priority_queue = {}
	priority_queue.__index = priority_queue
end

function priority_queue.new ()
	local self = setmetatable({},priority_queue)
	priority_queue.elements = {}
	priority_queue.size = 0	
	return self
end

function priority_queue.top(self)
	if self.elements[1] then
		return self.elements[1]
	else return false
	end
end

function priority_queue.push(self,data)
	self.size = self.size + 1
	self.elements[self.size] = data
	
	local parent = math.floor( self.size/2 )
	local cur = self.size
	if parent == 0 then parent = 1 end
	while parent>=1 and self.elements[parent] < self.elements[cur] do
		local temp = self.elements[parent]
		self.elements[parent] = self.elements[cur]
		self.elements[cur] = temp
		cur=parent
		parent= cur/2
	end
end

function priority_queue.pop(self)
	if self.elements[1] == nil then return false end
	self.elements[1]=self.elements[self.size]
	self.elements[self.size] = nil
	self.size = self.size - 1
	local cur =1 
	local son = 2
	local son2 = 3
	if self.elements[son] == nil then self.elements[son]=-2147483648 end
	if self.elements[son2] == nil then self.elements[son2]=-2147483648 end
	if self.elements[1] == nil then return true end
	while self.elements[son]>self.elements[cur] or self.elements[son2]>self.elements[cur] do
		if self.elements[son2] > self.elements[son] then son = son + 1 end
		local temp = self.elements[son]
		self.elements[son] = self.elements[cur]
		self.elements[cur] = temp
		cur = son
		son = cur * 2
		son2 = cur *2 +1
		if self.elements[son] == nil then self.elements[son]=-2147483648 end
		if self.elements[son2] == nil then self.elements[son2]=-2147483648 end
	end
	return true
end

function priority_queue.empty(self)
	if self.elements[1] == nil then return true
	else return false end
end

function priority_queue.size(self)
	return self.size
end