/* QUERY 1 */
CREATE TABLE Track (
    track_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    album_id INT,
    media_type_id INT,
    genre_id INT,
    composer TEXT,
    milliseconds INT,
    bytes INT,
    unit_price REAL
);

CREATE TABLE MusicVideo (
    music_video_id PRIMARY KEY
    track_id INT PRIMARY KEY,
    video_director TEXT NOT NULL
    track_id REFRENCES "Track"("track_id")
);

/* QUERY 2 */
INSERT INTO Track (name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price)
VALUES 
('Track 1', 1, 1, 1, 'Composer 1', 300000, 5000000, 0.99),
('Track 2', 1, 1, 1, 'Composer 1', 250000, 4000000, 0.99),
('Track 3', 2, 1, 2, 'Composer 3', 200000, 3000000, 0.99),
('Track 4', 2, 1, 2, 'Composer 4', 350000, 6000000, 0.99),
('Track 5', 3, 1, 3, 'Composer 5', 400000, 7000000, 0.99),
('Track 6', 3, 1, 3, 'Composer 5', 400000, 7000000, 0.99),
('Track 7', 4, 1, 4, 'Composer 6', 450000, 8000000, 0.99),
('Track 8', 4, 1, 4, 'Composer 6', 450000, 8000000, 0.99),
('Track 9', 5, 1, 5, 'Composer 7', 500000, 9000000, 0.99),
('Track 10', 5, 1, 5, 'Composer 7', 500000, 9000000, 0.99);

INSERT INTO MusicVideo (track_id, video_director)
VALUES 
(1, 'Director 1'),
(2, 'Director 2'),
(3, 'Director 3'),
(4, 'Director 4'),
(5, 'Director 5'),
(6, 'Director 6'),
(7, 'Director 7'),
(8, 'Director 8'),
(9, 'Director 9'),
(10, 'Director 10');

/* QUERY 3 */
INSERT INTO MusicVideo (track_id, video_director)
VALUES ((SELECT track_id FROM Track WHERE name = 'Voodoo'), 'Director 11');

/* QUERY 4 */
SELECT * FROM Track WHERE name GLOB '*[áéíóú]*';

/* QUERY 5 */
SELECT * 
FROM MusicVideo
INNER JOIN Track USING (track_id);

/* QUERY 6 */
SELECT video_director, COUNT(*) AS num_tracks
FROM MusicVideo
JOIN Track USING (track_id)
GROUP BY video_director;

/* BONUS - QUERY 8 */
SELECT *
FROM Track
WHERE genre_id NOT IN (
    SELECT genre_id
    FROM Track
    GROUP BY genre_id
    ORDER BY AVG(milliseconds) DESC
    LIMIT 5
);


