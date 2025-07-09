.mode column
.headers on

select road_rank, count(distinct road_name)
    from data
    group by road_rank
;

.width 3, 20
select road_no as '#', road_name
    from data
    where road_rank = 101
    group by road_name
    order by cast(road_no as integer)
;
