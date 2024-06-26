-- using HAVING, selects the users who have posted at least 1 review of a song, album, or artist
-- same output as select-user_review_count_2.sql

SELECT 
	user_id,
	username,
	COUNT(artist_review.review_id) + 
	COUNT(album_review.review_id) +
	COUNT(song_review.review_id)
	AS reviews
FROM
	"user"
LEFT JOIN
	artist_review
	USING (user_id)
LEFT JOIN
	album_review
	USING (user_id)
LEFT JOIN
	song_review
	USING (user_id)
GROUP BY user_id, username
HAVING
	(COUNT(artist_review.review_id) + 
	COUNT(album_review.review_id) +
	COUNT(song_review.review_id)) > 0
ORDER BY reviews DESC;