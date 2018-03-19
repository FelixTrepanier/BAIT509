

'
(1,0), (1,2), (1,5)
This would not be a valid bootstrap set because one of the observations in it is not in the original data (1,0).

(1,2), (2,0)
This would be a valid bootstrap set since it includes randomly selected observations from the original data.
OOB: (1,5)

(1,2), (1,2), (1,5)
This would be a valid bootstrap set since it includes randomly selected observations from the original data and some observations are repeating.
OOB:(2,0)


Regression prediction is the average, which in this case is 2

Classification prediction takes the most popular vote, which in this case is A
'