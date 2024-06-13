-- Create table DIVIDAS
CREATE TABLE IF NOT EXISTS public.DIVIDAS (
                                              ID SERIAL PRIMARY KEY,
                                              DESCRICAO TEXT NOT NULL,
                                              DT_CADASTRO TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                              DT_INICIO_PAGAMENTO TIMESTAMP,
                                              DT_FIM_PAGAMENTO TIMESTAMP
);

-- Create table HISTORICO_DIVIDAS with check constraint
CREATE TABLE IF NOT EXISTS public.HISTORICO_DIVIDAS (
                                                        ID SERIAL PRIMARY KEY,
                                                        FK_ID_DIVIDAS INT NOT NULL REFERENCES DIVIDAS(ID),
    VALOR CURRENCY NOT NULL,
    PARCELAS NUMBER NOT NULL,
    PARCELAS_PAGAS NUMBER NOT NULL,
    DT_CADASTRO TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ACAO CHAR NOT NULL CHECK (ACAO IN ('C', 'P', 'D'))  -- Added check constraint
);
