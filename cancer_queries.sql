# What is the average of the first sexual intercourse ?


select avg(first_intercourse)
from patients;

# What is the number of sex partners who have more than two and have STDs ?

select count(partner_num)
from patients
where partner_num>2 and patient_id in ( select patient_id
					from stds
                    where STD= 1);
                    
                                        
#	What is the number of people who have smoked more than two years and have STDs?

select count(patient_id)
from smoke
where smokesY>2 and patient_id in ( select patient_id
					from stds
                    where STD= 1);


#	What is the average  of people age who have diagnosed cancer ?
select avg(age)
from patients
where patient_id in(
				select patient_id
                from diognosis
                where cancer=1);

#	What is the number of people who have taken Hormonal Contraceptives and have STDs?
select count(patient_id)
from hormonaliud
where hormonal_cont =1 and patient_id in(
					select patient_id
                    from stds
                    where STD=1 );
#	What is the minimum patients age who have STDs?
select min(age) 
from patients
where patient_id in(
				select patient_id
                from stds
                where STD=1);
#	What is the number of people who have used IUD and have STDs?
select count(patient_id)
from hormonaliud
where IUD=1 and patient_id in (
				select patient_id
                from stds
                where STD=1);
#	What is the number of people who have used IUD or taken Hormonal Contraceptives and got pregnant?
select count(patient_id)
from hormonaliud
where IUD=1 or hormonal_cont=1 and patient_id in(
				select patient_id
                from patients
                where preg_num >0);
#	What is the number of people who are under 25 years old and have STDs?
select count(patient_id)
from patients
where age<25 and patient_id in(
			select patient_id
            from stds
            where STD = 1);

#	What is the maximum number of pregnancies ?
select max(preg_num)
from patients



