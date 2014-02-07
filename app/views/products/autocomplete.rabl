	object @products

	attributes :id => :id

	node :value do |p|

         if defined?(p.product.id)
          marca = p.product.brand.name
          nombre = p.product.name
         else
           marca = "Sin asignar"
           nombre = "Sin asignar"
           
         end

	 [' Producto:',nombre,' Marca:',marca].join('')
	end
