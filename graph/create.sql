BEGIN;

-- create schema for graph

create table graph (
    id serial primary key
);

create table vertex (
    id serial primary key,
    graph_id int not null,
    name int not null,
    constraint fk_graph_id foreign key (graph_id) references graph(id),
    unique (graph_id, name)
);

create table edge (
    id serial primary key,
    to_vertex int not null,
    from_vertex int not null,
    wght int not null,
    constraint fk_to_vertex foreign key (to_vertex) references vertex(id),
    constraint fk_from_vertex foreign key (from_vertex) references vertex(id)
);

-- create graph entries
-- directly providing id instead of using sequence because of ease of implementation.
-- otherwise will have to track those values as well, also, not exactly sure how to do that using just sql.

-- graph 1 (sample)

insert into graph (id) values (1);

insert into vertex (id, graph_id, name) values (1, 1, 1);
insert into vertex (id, graph_id, name) values (2, 1, 2);
insert into vertex (id, graph_id, name) values (3, 1, 3);
insert into vertex (id, graph_id, name) values (4, 1, 4);

insert into edge (id, from_vertex, to_vertex, wght) values (1, 1, 2, 1);
insert into edge (id, from_vertex, to_vertex, wght) values (2, 1, 2, 2);
insert into edge (id, from_vertex, to_vertex, wght) values (3, 2, 1, 4);
insert into edge (id, from_vertex, to_vertex, wght) values (4, 2, 4, 1);
insert into edge (id, from_vertex, to_vertex, wght) values (5, 4, 4, 1);

-- graph 2 (single vertex no edge)

insert into graph (id) values (2);

insert into vertex (id, graph_id, name) values (5, 2, 1);

-- graph 3 (no vertex)

insert into graph (id) values (3);

-- graph 4

insert into graph (id) values (4);

insert into vertex (id, graph_id, name) values (6, 4, 1);
insert into vertex (id, graph_id, name) values (7, 4, 2);
insert into vertex (id, graph_id, name) values (8, 4, 3);
insert into vertex (id, graph_id, name) values (9, 4, 4);
insert into vertex (id, graph_id, name) values (10, 4, 5);
insert into vertex (id, graph_id, name) values (11, 4, 6);
insert into vertex (id, graph_id, name) values (12, 4, 7);
insert into vertex (id, graph_id, name) values (13, 4, 8);

insert into edge (id, from_vertex, to_vertex, wght) values (6, 6, 7, 4);
insert into edge (id, from_vertex, to_vertex, wght) values (7, 6, 8, 3);
insert into edge (id, from_vertex, to_vertex, wght) values (8, 6, 9, 1);
insert into edge (id, from_vertex, to_vertex, wght) values (9, 6, 10, 5);
insert into edge (id, from_vertex, to_vertex, wght) values (10, 6, 12, 1);

insert into edge (id, from_vertex, to_vertex, wght) values (11, 7, 7, 1);
insert into edge (id, from_vertex, to_vertex, wght) values (12, 7, 11, 3);
insert into edge (id, from_vertex, to_vertex, wght) values (13, 7, 13, 2);
insert into edge (id, from_vertex, to_vertex, wght) values (14, 7, 6, 5);
insert into edge (id, from_vertex, to_vertex, wght) values (15, 7, 10, 4);

insert into edge (id, from_vertex, to_vertex, wght) values (16, 8, 10, 1);
insert into edge (id, from_vertex, to_vertex, wght) values (17, 8, 13, 4);
insert into edge (id, from_vertex, to_vertex, wght) values (18, 9, 12, 1);
insert into edge (id, from_vertex, to_vertex, wght) values (19, 9, 8, 2);

insert into edge (id, from_vertex, to_vertex, wght) values (20, 10, 7, 1);
insert into edge (id, from_vertex, to_vertex, wght) values (21, 11, 12, 4);
insert into edge (id, from_vertex, to_vertex, wght) values (22, 12, 8, 1);
insert into edge (id, from_vertex, to_vertex, wght) values (23, 13, 6, 2);

insert into edge (id, from_vertex, to_vertex, wght) values (24, 7, 7, 2);

-- graph 5

insert into graph (id) values (5);
insert into vertex (id, graph_id, name) values (14, 5, 1);

insert into edge (id, from_vertex, to_vertex, wght) values (25, 14, 14, 2);
insert into edge (id, from_vertex, to_vertex, wght) values (26, 14, 14, 3);
insert into edge (id, from_vertex, to_vertex, wght) values (27, 14, 14, 4);
insert into edge (id, from_vertex, to_vertex, wght) values (28, 14, 14, 5);

-- graph 6

insert into graph (id) values (6);
insert into vertex (id, graph_id, name) values (15, 6, 1);
insert into vertex (id, graph_id, name) values (16, 6, 2);

insert into edge (id, from_vertex, to_vertex, wght) values (29, 15, 16, 2);
insert into edge (id, from_vertex, to_vertex, wght) values (30, 16, 15, 3);
insert into edge (id, from_vertex, to_vertex, wght) values (31, 15, 15, 1);
insert into edge (id, from_vertex, to_vertex, wght) values (32, 16, 16, 1);

COMMIT;