-- Data Cleaning --

select *
from layoffs;

-- Steps to follow
-- 1. check for duplicates and remove any
-- 2. standardize data and fix errors
-- 3. Look at null values and see what 
-- 4. remove any columns and rows that are not necessary - few ways

#check for duplicates and remove any
create table layoffs_staging
select * 
from layoffs;

select *
from layoffs_staging;

with temp_cte as
(select *,
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) row_num
from layoffs_staging)
select *
from temp_cte
where row_num > 1;

select *
from (select *,
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) row_num
from layoffs_staging) alias1
where row_num >1;

create table layoffs_staging2
select *,
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,'date',stage,country,funds_raised_millions) row_num
from layoffs_staging;

delete
from layoffs_staging2
where row_num > 1;

select *
from layoffs_staging2
order by 1;

#standardize data and fix errors
update layoffs_staging2
set company = trim(company);

update layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';

update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'United States%';

update layoffs_staging2
set `date` = str_to_date(`date`,'%m/%d/%Y');

alter table layoffs_staging2
modify column `date` date;

select *
from layoffs_staging2
order by 1;

#Look at null values and see what 
select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging2
where industry is null
or industry = '';

update layoffs_staging2
set industry = null
where industry = '';

update layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is null
and t2.industry is not null;

select ls21.industry,ls22.industry
from layoffs_staging2 ls21
join layoffs_staging2 ls22
on ls21.company = ls22.company
and ls21.location = ls22.location
where (ls21.industry is null or ls21.industry = '')
and ls22.industry is not null;

delete
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

#remove any columns and rows that are not necessary - few ways
alter table layoffs_staging2
drop column row_num;

select *
from layoffs_staging2;