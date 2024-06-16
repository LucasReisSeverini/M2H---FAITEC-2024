drop database if exists m2h;
create database m2h;

\c m2h;

begin;

--Relacao USUARIO
create table usuario(
    id serial primary key,
    nome character varying(100) not null,
    cpf character varying(14) not null,
    endereco character varying(100) not null,
    email character varying(100),
    senha character varying(14) not null,
    data_nasc timestamp without time zone not null,
    administrador boolean not null,
    unique(cpf, email)
);

--Relacao PACIENTE
create table paciente(
    id serial primary key,
    usuario_id integer not null references usuario(id) on update no action on delete no action,
    unique(usuario_id)
);

--Relcao PROFISSIONAL
create table profissional(
    id serial primary key,
    cfp character varying(20) not null,
    end_atendimento character varying(200) not null,
    usuario_id integer not null references usuario(id) on update no action on delete no action,
    unique(cfp)
);

--Relacao DISPONIBILIDADE
create table disponibilidade(
    id serial primary key,
    data_ini timestamp without time zone,
    data_fim timestamp without time zone,
    profissional_id integer not null references profissional(id),
    unique(data_ini, data_fim, profissional_id)
);

--Relacao DIA
create table dia(
    id serial primary key,
    turno timestamp without time zone,
    dia_sem timestamp without time zone,
    hora_ini timestamp without time zone,
    hora_fim timestamp without time zone,
    disponibilidade_id integer not null references disponibilidade(id),
    unique(hora_ini, hora_fim)
);

--Relacao AGENDA
create table agenda(
    id serial primary key,
    datahora timestamp without time zone,
    confirmacao boolean not null,
    atend_online boolean not null,
    disponibilidade_id integer not null references disponibilidade(id),
    dia_id integer not null references dia(id),
    usuario_id integer not null references usuario(id),
    unique(datahora, usuario_id)
);

--Relacao CONSULTA
create table consulta(
    id serial primary key,
    relatorio text,
    avaliacao character varying(10) check (avaliacao in ('Ruim', 'Bom', 'Otimo', "Excelente")),
    comentario_avaliacao character varying(144),
    agenda_id integer not null references agenda(id),
    unique(agenda_id)
);

--Relacao ESPECIALIDADE
create table especialidade(
    id serial primary key,
    descricao character varying(100) not null,
    profissional_id integer not null references profissional(id),
    unique(descricao, profissional_id)
);

--Relacao CLINICA
create table clinica(
    id serial primary key,
    lat_local character varying(4) not null,
    log_local character varying(4) not null,
    razao_social character varying(150) not null,
    nome_fantasia character varying(100),
    email_clinica character varying(100) not null,
    cnpj character varying(14) not null,
    responsavel character varying(100),
    endereco character varying(200) not null,
    unique(razao_social, cnpj)
);

--Relacao ENDERECO
create table endereco(
    id serial primary key,
    logradouro character varying(100) not null,
    cep character varying(8) not null,
    bairro character varying(100) not null,
    complemento character varying(50)
);


commit;
