
-- degree of every vertex of a graph based on filter.

select g.id as graph_id,
    coalesce(v.name, -1) as node, -- -1 stands for no node in graph.
    count(e.id) filter (where e.to_vertex = v.id) +
    count(e.id) filter (where e.from_vertex = v.id) as degree
from graph g left join vertex v on
    v.graph_id = g.id
left join edge e on 
    v.id = e.to_vertex
    or v.id = e.from_vertex
where g.id = 4
group by 1, 2
order by 1, 2;


-- average degree of every graph using subquery.

select graph_id, sum(degree), count(degree), avg(degree)::float as avg_degree from (
    select g.id as graph_id,
        coalesce(v.name, -1) as node,
        count(e.id) filter (where e.to_vertex = v.id) +
        count(e.id) filter (where e.from_vertex = v.id) as degree
    from graph g left join vertex v on
        v.graph_id = g.id
    left join edge e on 
        v.id = e.to_vertex
        or v.id = e.from_vertex
    -- where g.id = 1
    group by 1, 2
    order by 1, 2
)a group by 1 order by 1;

-- average degree of graph using formulae (2e/n) where e is number of edges and n is number of nodes.

select g.id as graph_id,
    count(distinct e.id) as e,
    count(distinct v.id) as n,
    case when count(distinct v.id) = 0 then 0 else
    2 * count(distinct e.id)::float / count(distinct v.id)::float end as avg_degree 
from graph g left join vertex v on
    v.graph_id = g.id
left join edge e on 
    v.id = e.to_vertex
    or v.id = e.from_vertex
-- where g.id = 1
group by 1
order by 1
