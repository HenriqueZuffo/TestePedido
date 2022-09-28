CREATE TABLE pedidos(
	nropedido integer NOT NULL,
	DATA date NOT NULL,
	codcliente integer NOT NULL,
	situacao integer NOT NULL,
	dataentrega date NOT NULL,
	codcpagto smallint NOT NULL,
	codformapagto smallint,
	qtdtotal double PRECISION NOT NULL,
	valtotal double PRECISION,
	tipo char(1) NOT NULL,
	obs varchar(5000)
)



ALTER TABLE pedidos ADD CONSTRAINT pk_pedidos PRIMARY key(nropedido);

ALTER TABLE pedidos ADD CONSTRAINT fk_cliente_pedidos FOREIGN key(codcliente) REFERENCES clientes(codcliente);
ALTER TABLE pedidos ADD CONSTRAINT fk_cpagto_pedidos FOREIGN KEY(codcpagto) REFERENCES cpagto(CODCPAGTO);
ALTER TABLE pedidos ADD CONSTRAINT fk_formapagto_pedidos FOREIGN KEY(codformapagto) REFERENCES formapagto(CODFORMAPAGTO);


CREATE generator pedidos_cod; 

CREATE OR ALTER TRIGGER pedidos_bi FOR pedidos 
BEFORE INSERT POSITION 0
AS 
BEGIN 
	NEW.DATA = CURRENT_DATE;
	
	NEW.nropedido = gen_id("PEDIDOS_COD", 1);
END;

comment ON COLUMN pedidos.SITUACAO IS '1 -> Pendente
	2 -> Finalizado';

comment ON COLUMN pedidos.TIPO  IS 'V -> Venda
	B -> Bonificação
    T -> Troca';	