--Adicionando alguns usuários
insert into usuarios values (852369, 'lucivan@gmail.com', 'lucivan', 12345678, 0);
insert into usuarios values (172839, 'lucivan@gmail.com', 'lucivan', 12345678, 1);
insert into usuarios values (445566, 'ana@gmail.com', 'ana123', 12345678, 1);
insert into usuarios values (112233, 'regis@gmail.com', 'regis', 12345678, 2);

--Adicionando algumas salas
insert into salas(bloco, descricao, n_porta) values(1,'Nao possui nada', 1);
insert into salas(bloco, descricao, n_porta) values(1,'1 projetor', 2);
insert into salas(bloco, descricao, n_porta) values(1,'40 cadeiras', 3);
insert into salas(bloco, descricao, n_porta) values(1,'bastante grande', 4);

--Inserindo algumas reservas
insert into reservas(descricao, dia, horario, mes, sala_id, user_matricula) values
('Aula de FUP', 4, 'D', 1, 4, 376762);
insert into reservas(descricao, dia, horario, mes, sala_id, user_matricula) values
('Aula de FUP', 4, 'A', 1, 4, 112233);