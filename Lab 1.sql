-----------------------------------------------Part-A-------------------------------------------------
--1. Retrieve a unique genre of songs.
SELECT DISTINCT GENRE FROM SONGS;

--2. Find top 2 albums released before 2010.
SELECT TOP 2 ALBUM_TITLE FROM ALBUMS WHERE RELEASE_YEAR<2010;

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005)
INSERT INTO SONGS VALUES(1245,'ZAROOR',2.55,'FEEL GOOD',1005);

--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’
UPDATE SONGS SET GENRE='HAPPY' WHERE SONG_TITLE='ZAROOR';

--5. Delete an Artist ‘Ed Sheeran’
DELETE FROM ARTISTS WHERE ARTIST_NAME='Ed Sheeran';

--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)]
ALTER TABLE SONGS ADD RATING DECIMAL(3,2);

--7. Retrieve songs whose title starts with 'S'.
SELECT * FROM SONGS WHERE SONG_TITLE LIKE 'S%';

--8. Retrieve all songs whose title contains 'Everybody'.
SELECT * FROM SONGS WHERE SONG_TITLE LIKE '%EVERYBODY%';

--9. Display Artist Name in Uppercase.
SELECT UPPER(ARTIST_NAME) AS ARTIST_NAME FROM ARTISTS;

--10. Find the Square Root of the Duration of a Song ‘Good Luck’.
SELECT SQRT(DURATION) AS DURATION_SQRT FROM SONGS WHERE SONG_TITLE='GOOD LUCK';

--11. Find Current Date.
SELECT GETDATE() AS CURRENTDATETIME;

--12. Find the number of albums for each artist.
SELECT ARTIST_ID,COUNT(ALBUM_TITLE) AS TOTAL_ALBUMS FROM ALBUMS GROUP BY ARTIST_ID;

--13. Retrieve the Album_id which has more than 5 songs in it.
SELECT ALBUM_ID,COUNT(SONG_ID) AS NOOFSONGS FROM SONGS GROUP BY ALBUM_ID HAVING COUNT(ALBUM_ID)>3;

--14. Retrieve all songs from the album 'Album1'. (using Subquery)
SELECT SONG_TITLE FROM SONGS WHERE ALBUM_ID IN(SELECT ALBUM_ID FROM ALBUMS WHERE ALBUM_TITLE='ALBUM1');

--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery)
SELECT ALBUM_TITLE FROM ALBUMS WHERE ARTIST_ID IN(SELECT ARTIST_ID FROM ARTISTS WHERE ARTIST_NAME='Aparshakti Khurana');

--16. Retrieve all the song titles with its album title.
SELECT SONGS.SONG_TITLE,ALBUMS.ALBUM_TITLE
FROM ALBUMS JOIN SONGS
ON ALBUMS.ALBUM_ID=ALBUMS.ALBUM_ID;

--17. Find all the songs which are released in 2020.
SELECT SONGS.SONG_TITLE,ALBUMS.RELEASE_YEAR
FROM ALBUMS JOIN SONGS 
ON ALBUMS.ALBUM_ID=SONGS.ALBUM_ID
WHERE RELEASE_YEAR=2020;

--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.
CREATE VIEW FAV_SONGS AS 
SELECT SONG_ID,SONG_TITLE 
FROM SONGS 
WHERE SONG_ID BETWEEN 101 AND 105;

--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view.
UPDATE FAV_SONGS SET SONG_TITLE='JANNAT' WHERE SONG_ID=101;

--20. Find all artists who have released an album in 2020.
SELECT ARTISTS.ARTIST_NAME,ALBUMS.RELEASE_YEAR 
FROM ARTISTS JOIN ALBUMS 
ON ARTISTS.ARTIST_ID=ALBUMS.ARTIST_ID 
WHERE RELEASE_YEAR=2020;

--21. Retrieve all songs by Shreya Ghoshal and order them by duration.
SELECT ARTISTS.ARTIST_NAME,SONGS.DURATION,ALBUMS.ALBUM_ID
FROM ARTISTS 
JOIN ALBUMS ON ARTISTS.ARTIST_ID=ALBUMS.ARTIST_ID
JOIN SONGS ON ALBUMS.ALBUM_ID=SONGS.ALBUM_ID
WHERE ARTIST_NAME='SHREYA GHOSHAL'
ORDER BY DURATION;

-----------------------------------------------Part-B-------------------------------------------------
--22. Retrieve all song titles by artists who have more than one album.
SELECT SONGS.SONG_TITLE,COUNT(ALBUMS.ALBUM_ID) FROM SONGS 
JOIN ALBUMS 
ON SONGS.ALBUM_ID=ALBUMS.ALBUM_ID
JOIN ARTISTS 
ON ARTISTS.ARTIST_ID=ALBUMS.ARTIST_ID
GROUP BY SONGS.SONG_TITLE
HAVING COUNT(ALBUMS.ALBUM_ID)>1;

--23. Retrieve all albums along with the total number of songs.
SELECT ALBUMS.ALBUM_TITLE,COUNT(SONGS.SONG_TITLE) AS TOTALSONGS 
FROM ALBUMS JOIN SONGS
ON ALBUMS.ALBUM_ID=SONGS.ALBUM_ID
GROUP BY ALBUM_TITLE;

--24. Retrieve all songs and release year and sort them by release year.
SELECT SONGS.SONG_TITLE,ALBUMS.RELEASE_YEAR
FROM ALBUMS JOIN SONGS
ON ALBUMS.ALBUM_ID=SONGS.ALBUM_ID
ORDER BY RELEASE_YEAR;

--25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs.
SELECT GENRE,COUNT(SONG_TITLE) AS MORETHAN2SONGS
FROM SONGS
GROUP BY GENRE
HAVING COUNT(SONG_TITLE)>2;

--26. List all artists who have albums that contain more than 3 songs.
SELECT ARTISTS.ARTIST_NAME,COUNT(SONGS.SONG_TITLE)
FROM ARTISTS JOIN ALBUMS
ON ARTISTS.ARTIST_ID=ALBUMS.ARTIST_ID
JOIN SONGS ON ALBUMS.ALBUM_ID=SONGS.ALBUM_ID
GROUP BY ARTIST_NAME
HAVING COUNT(SONGS.SONG_TITLE)>3;

-----------------------------------------------Part-C-------------------------------------------------
--27. Retrieve albums that have been released in the same year as 'Album4'


--28. Find the longest song in each genre
SELECT GENRE,MAX(DURATION)
FROM SONGS
GROUP BY GENRE;

--29. Retrieve the titles of songs released in albums that contain the word 'Album' in the title.


--30. Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes.
SELECT ARTISTS.ARTIST_NAME,SUM(SONGS.DURATION) AS TOTAL_DURATION
FROM ARTISTS JOIN ALBUMS ON ARTISTS.ARTIST_ID=ALBUMS.ARTIST_ID
JOIN SONGS ON ALBUMS.ALBUM_ID=SONGS.ALBUM_ID
GROUP BY ARTIST_NAME
HAVING SUM(SONGS.DURATION)>15.00;
