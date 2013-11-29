	object @products

	attributes :id => :id

	node :value do |p|
	 [p.name].join('')
	end
