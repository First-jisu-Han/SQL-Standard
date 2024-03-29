SELECT MONTH(START_DATE) AS MONTH, CH.CAR_ID, COUNT(*) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS CH
INNER JOIN
(
    SELECT CAR_ID , COUNT(*) AS CNT FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY CAR_ID
) AS T
ON T.CAR_ID=CH.CAR_ID
WHERE T.CNT >= 5 AND YEAR(START_DATE)=2022 AND MONTH(START_DATE) IN (8,9,10)
GROUP BY MONTH(START_DATE), CH.CAR_ID
ORDER BY MONTH(START_DATE), CH.CAR_ID DESC