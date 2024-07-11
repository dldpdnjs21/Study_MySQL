-- 숫자함수 --
select abs(-5), abs(0), abs(+5)
from dual;

select ceil(12.2), ceiling(12.2), ceil(-12.2), ceiling(-12.2)
from dual;

select floor(12.6), floor(-12.2)
from dual;

select round(1526.159), round(1526.159, 0), round(1526.159, 1),
		round(1526.159, 2), round(1526.159, -1), round(1526.159, -3)
from dual;