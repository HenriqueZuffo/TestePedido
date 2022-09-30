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
	NEW.nropedido = gen_id("PEDIDOS_COD", 1);
END;

comment ON COLUMN pedidos.SITUACAO IS '1 -> Pendente
	2 -> Finalizado';

comment ON COLUMN pedidos.TIPO  IS 'V -> Venda
	B -> Bonificação
    T -> Troca';




CREATE TABLE ped_prods(
    NROPED_PRODS integer NOT NULL,
	nropedido integer NOT NULL,
	nroitem integer NOT NULL,
	codproduto varchar(20) NOT null,
	qtde double PRECISION NOT NULL,
	un varchar(3) NOT NULL,
	preco double PRECISION NOT NULL,
	percdesconto double PRECISION,
	valdesconto double PRECISION,
	valtotal double PRECISION NOT NULL
)



ALTER TABLE ped_prods ADD CONSTRAINT pk_pedprods PRIMARY key(NROPED_PRODS, nroitem);

ALTER TABLE ped_prods ADD CONSTRAINT fk_pedprods_produto FOREIGN key(codproduto) REFERENCES produtos(CODPRODUTO);



CREATE generator pedprods_cod; 

CREATE OR ALTER TRIGGER pedprods_bi FOR ped_prods 
BEFORE INSERT POSITION 0
AS 
DECLARE VARIABLE seqItem integer;
BEGIN 
	
	IF (COALESCE(NEW.NROPED_PRODS, 0) = 0) THEN BEGIN 
		NEW.NROPED_PRODS = gen_id("PEDPRODS_COD", 1);			
	END
		
	SELECT COALESCE(max(nroitem), 0)
	  FROM ped_prods
	  WHERE nroped_prods = NEW.nroped_prods AND 
	        nropedido = NEW.nropedido
	 INTO :seqItem;
	
	IF ((:seqItem <= 0) OR (:seqItem IS NULL)) THEN begin
		NEW.nroitem = 1;
	END ELSE  begin
		NEW.nroitem = :seqItem +1;	
	END
END;