""" def discount (historial: dict ):
    def apply_discount (amount:float)->float:
        for customer,customer_buys in historial.items():
            if len(customer_buys)>15:
              amount = amount - (amount * 0.20)
            if len(customer_buys)>10:
                amount = amount -(amount * 0.15)
            if len(customer_buys)>5:
                amount = amount - (amount * 0.10)
            else:
                return amount
        return amount
    return apply_discount """
                
                
def generar_descuento(historial):
    def aplicar_descuento(monto):
        descuento = 0
        for compras in historial.values():
            if len(compras) > 15:
                descuento =  0.20
            elif len(compras) > 10:
                descuento =  0.15
            elif len(compras) > 5:
                descuento =  0.10

        return monto - (monto * descuento)

    return aplicar_descuento

descuento_func = generar_descuento({
    "Cliente1": [100, 200, 150, 300, 250],  
    "Cliente2": [150, 200, 100, 200, 250, 150, 200, 300, 250, 150],  
    "Cliente3": [100, 150, 200, 250, 100, 150, 200, 250, 100, 150, 200, 250, 100, 150, 200],  
})

monto_compra1 = 500
monto_compra2 = 1000
monto_compra3 = 1500

print("Monto de compra: $", monto_compra1, "Descuento aplicado: $", descuento_func(monto_compra1))
print("Monto de compra: $", monto_compra2, "Descuento aplicado: $", descuento_func(monto_compra2))
print("Monto de compra: $", monto_compra3, "Descuento aplicado: $", descuento_func(monto_compra3))
