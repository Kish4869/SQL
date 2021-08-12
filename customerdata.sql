

/* Create the table to import csv file */

CREATE TABLE customer_data (
    ID SERIAL PRIMARY KEY,
	Gender VARCHAR(255) NOT NULL,
	Age INTEGER NOT NULL,
	Graduated VARCHAR(255) NOT NULL,
	Profession VARCHAR(255) NOT NULL,
	Spending_Score VARCHAR(255) NOT NULL,
	Var_1 VARCHAR(255) NOT NULL,
	Segmentation VARCHAR(255) NOT NULL
);

/* Counting the number of inputs on customer_data table */
SELECT COUNT(*)
FROM customer_data;

/* Counting the number of customers whith Average spending score */ 
SELECT COUNT(spending_score) 
FROM customer_data
WHERE spending_score='Average';

/* Counting the number of female customers */
SELECT COUNT(gender) 
FROM customer_data
WHERE gender='Female';

/* Counting the number of female customers who are 25 years or older */
SELECT * FROM customer_data 
		COUNT (ID)
WHERE Age >= 25 AND Gender = 'Female';

/* Select all customers that are not unemployed and is graduated */
SELECT gender, graduated, profession FROM customer_data 
		WHERE profession != 'Unemployed' AND graduated = 'Yes'
GROUP BY profession, gender, graduated;

/* Select all lawyers who are 30 years or older*/
SELECT id, age, spending_score FROM customer_data 
WHERE Age >= 30 AND profession= 'Lawyer'
ORDER BY spending_score, age DESC;

/* Counting the number of male and female customers on each spending level */
SELECT gender, COUNT(ID), spending_score FROM customer_data
GROUP BY gender, spending_score
ORDER BY gender;

/* Show the average age of an Engineer with High spending level */
SELECT AVG(age), profession, spending_score FROM customer_data
WHERE spending_score='High' AND profession='Engineer'
GROUP BY profession, spending_score;

/* Counting the number of female artist whose age are between 20 and 50 years and have a High spending level*/ 
SELECT COUNT(gender) women_artist FROM (
					SELECT age, gender, COUNT(profession='Artist'), spending_score
					FROM customer_data 
					GROUP BY age, profession, gender, spending_score
					HAVING (age between 20 AND 50) AND spending_score='High'
		) AS women_artist
	WHERE gender = 'Female';



