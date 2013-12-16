	object @products

	attributes :id => :id, :serial => :serial, :vale_sale => :vale_sale

	node :value do |p|

         if defined?(p.product.id)
          marca = p.product.brand.name
          nombre = p.product.name
         else
           marca = "Sin asignar"
           nombre = "Sin asignar"
           
         end

['CodigoBarra:',p.barcode, ' Serial:',p.serial,' Producto:',nombre,' Marca:',marca, ' Valor:',p.vale_sale].join('')
	  
	end


