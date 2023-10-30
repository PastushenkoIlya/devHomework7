select rsd.name, rsd.surname, rsd.email, group_concat(distinct(bld.address)), group_concat(flt.apartment_number),
group_concat(flt.area)
from  residents as rsd, buildings as bld, flats as flt, owners_to_flats
where rsd.id = owners_to_flats.owner_id and
flt.id = owners_to_flats.flat_id and
flt.building_id = bld.id and
owners_to_flats.owner_id = any(select id from residents)
group by name, surname, email
having count(flt.apartment_number) < 2 