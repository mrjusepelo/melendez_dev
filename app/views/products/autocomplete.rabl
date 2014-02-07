	object @products

	attributes :id => :id

	node :value do |p|

         if defined?(p.id)
          marca = p.brand.name
          nombre = p.name
         else
           marca = "Sin asignar"
           nombre = "Sin asignar"
           
         end

	 [' Producto:',nombre,' Marca:',marca].join('')
	end
