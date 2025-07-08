.mode column
.headers on

select road_rank, count(distinct road_name)
    from data
    group by road_rank
;
