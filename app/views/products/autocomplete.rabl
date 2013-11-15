	object @products

	attributes :id => :id

	node :value do |p|
	 [p.name, ' MARCA:', p.brand.name,  ' CANTIDAD:', p.amount, ' DESCRIPCION:', p.description].join('')
	end
