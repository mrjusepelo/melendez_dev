	object @products

	attributes :id => :id

	node :value do |p|
	 [p.name, p.amount].join('-')
	end
