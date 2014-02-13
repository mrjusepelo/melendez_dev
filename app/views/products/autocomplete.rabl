	object @products

	attributes :id => :id

	node :value do |p|

         if defined?(p.id)
          marca = p.brand.name
          nombre = p.name
          description = p.description
         else
           marca = "Sin asignar"
           nombre = "Sin asignar"
           description = "Sin asignar"
           
         end

	 [' Producto:',nombre,' Marca:',marca, ' Descripcion:',description ].join('')
	end
