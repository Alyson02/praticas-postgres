SELECT * FROM produtos WHERE id in (SELECT id_produto FROM compras where id_cliente = 2);